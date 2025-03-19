#!/bin/sh
set -ex
apk add --no-cache jq

export VAULT_FORMAT=json

unseal_vault() {
  vault operator unseal $(cat /keys/unseal)
  vault login token=$(cat /keys/token)
}

if [[ -f /keys/init.json ]]
then
  echo "Vault already initialized"
  unseal_vault
else
  echo "Vault not initialized"
  vault operator init -key-shares=1 -key-threshold=1 > /keys/init.json
  cat /keys/init.json | jq -r '.root_token' > /keys/token
  cat /keys/init.json | jq -r '.unseal_keys_hex[0]' > /keys/unseal
  unseal_vault

  vault secrets enable -path=secret -version=2 kv
  vault auth enable approle
  vault policy write admin-policy /helpers/admin-policy.hcl
  vault write auth/approle/role/dev-role token_policies="admin-policy"
  vault read auth/approle/role/dev-role/role-id \
    | jq -r '.data.role_id' > /keys/role_id
  vault write -f auth/approle/role/dev-role/secret-id \
    | jq -r '.data.secret_id' > /keys/secret_id
fi
