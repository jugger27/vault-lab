# vault-lab
This is a Hashicorp Vault setup with persistent storage, so it can be used together
with other research projects (ex: Jenkins integration).

## Deployment
Execute `docker compose up -d` to start Hashicorp Vault, which also trigger the initialization
scripts that will do the initial setup. This will create the following directorys:
- `keys`: contains all the keys and tokens
- `data`: will have the vault's persistent data
- `logs`: vault container logs

The root token is written to the file `keys\token`

## Access Vault
You can use the following ways to access the vault:

GUI: Access [http://localhost:8200](http://localhost:8200) and use the token value to authenticate

CLI: Execute `vault login token=$(cat keys/token)`


## Reset
Execute `./reset_vault.sh` script to cleanup all data (keys, data, logs).
Note that this will **destroy all persistent data**.

## Disclaimers
- Some info and scripts of this setup has been extracted from other sites, for which I cannot
remember. Please open an issue if you know the source references for this.
- This setup or myself are no way related to Hashicorp Inc. It just serves as research purpose.
- This setup should not be used in Production. Please check product documentation
for an official and supported configuration
