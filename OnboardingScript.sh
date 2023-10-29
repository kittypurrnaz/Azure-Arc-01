# Add the service principal application ID and secret here
ServicePrincipalId="8fe141db-53ff-45b8-b542-263bb0eae268";
ServicePrincipalClientSecret="zSR8Q~uM5r~VIHoO0q5THXQoXJCMONHzqpZk9dsg";


export subscriptionId="352455fe-c849-4e07-b99d-8abf325cc3d4";
export resourceGroup="AzureArcDemo";
export tenantId="655d8472-2680-4a64-87bf-a23851b4cc8d";
export location="southeastasia";
export authType="principal";
export correlationId="0c4bf1df-7836-4fbe-a047-c69843625f24";
export cloud="AzureCloud";


# Download the installation package
output=$(wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh 2>&1);
if [ $? != 0 ]; then wget -qO- --method=PUT --body-data="{\"subscriptionId\":\"$subscriptionId\",\"resourceGroup\":\"$resourceGroup\",\"tenantId\":\"$tenantId\",\"location\":\"$location\",\"correlationId\":\"$correlationId\",\"authType\":\"$authType\",\"operation\":\"onboarding\",\"messageType\":\"DownloadScriptFailed\",\"message\":\"$output\"}" "https://gbl.his.arc.azure.com/log" &> /dev/null || true; fi;
echo "$output";

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh;

# Run connect command
sudo azcmagent connect --service-principal-id "$ServicePrincipalId" --service-principal-secret "$ServicePrincipalClientSecret" --resource-group "$resourceGroup" --tenant-id "$tenantId" --location "$location" --subscription-id "$subscriptionId" --cloud "$cloud" --correlation-id "$correlationId" --verbose;
