# run:
# source ./gcp_variables/set_gcp_variables.sh
export TF_VAR_gcp_project="chrome-bearing-336918"
export TF_VAR_project=$TF_VAR_gcp_project
export TF_VAR_gcp_credentials_file="../gcp_variables/chrome-bearing-336918-09064f2caabd_terraform.json"
echo $TF_VAR_gcp_project
echo $TF_VAR_gcp_credentials_file
