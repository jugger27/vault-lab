# vault-demo
This is a Hashicorp Vault setup with persistent storage, so it can be used together
with other research projects (ex: Jenkins integration).

## Deployment
Execute `./startVault.sh` script which will run the necessary steps for
deploying HashiCorp Vault. This will create an Docker external volume, run docker compose
and run bootstrap scripts. The bootstrap scripts will setup the necessary settings
(roles, secrets, etc) to be able to use Hashicorp Vault.

# Getting started
After Vault has started, you should use the `VAULT_TOKEN=`output and copy&paste it to login
to Hashicorp Vault on a browser window on (http://localhost:8200/ui)

## Cleanup
Execute `./cleanVault.sh` script to cleanup all lingering data

### Disclaimers
- Some info and scripts of this setup has been extracted from other sites, for which I cannot
remember. Please open an issue if you know the source references for this.
- This setup or myself are no way related to Hashicorp Inc. It just serves as research purpose.
- This setup should not be used in Production. Please check product documentation
for an official and supported configuration
