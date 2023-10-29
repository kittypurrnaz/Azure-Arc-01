# Azure Arc Enabled-Servers | Manual Linux Server Onboarding || Oracle VM VirtualBox Manager

## A step-by-step guide and example project to demonstrate the onboarding of a Linux Server running on a virtual machine with manual steps over azcmagent: command not found

This project is a basic guide on the process of onboarding a Linux server . Oracle's VM VirtualBox Manager is used, you can create one using expert mode. It's the mode I usually go for anyways. (You're going to need basic/prior experience in deploying or creating a virtual machine via a type 2 Hypervisor. There's a lot of tutorials on youtube, it's purrdy simple really. If you need help, send a message over to my instagram @kittypurrnaz): 

* OS: Debian (64-bit)
* Kali Linux
* Base Memory: 2048 MB
* Processors: 2
* Storage: 20GB

## BRIEF STEPS (https://www.youtube.com/watch?v=pALL_IjJ4H4)

* Head to portal.azure.com
* Azure Arc Servers -> Add multiple servers
* Select your subcription group -> select your resource group -> select region -> OS: Linux -> connectivity method: Public Endpoint -> Authentication: select service principal
* Tags: optional (I skipped this section)
* Download script

## OnboardingScript.sh (Things to add into the script) + (https://www.youtube.com/watch?v=pALL_IjJ4H4)

* --verbose; (right at the end of "$correlationId")
* servicePrincipalSecret="ENTER SECRET HERE" (Replace this with the certificates & secret value)
* sh OnboardingScript.sh
* azcmagent (check if command is found, if not, it means you need to do it manually)

## Manual steps

### Rereading the package lists
sudo -E apt update

### Curl Modul - Installation
sudo -E apt install -y curl

### Dept - File Download using Curl
curl https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/a/azcmagent/azcmagent_1.20.02012.246_amd64.deb -o /tmp/azcmagent.deb

### Package installation
sudo -E apt install -y /tmp/azcmagent.deb

### AZCMAGENT - Availability Check
azcmagent

### Connecting Agent
azcmagent connect --resource-group "resourceGroupName" --tenant-id "tenantID" --location "regionName" --subscription-id "subscriptionID" --cloud "cloudName"
# see link: https://it-infrastructure.solutions/onboarding-azure-arc-linux-ubuntu/

# IMPORTANT -> CHANGE THE VARIABLES WITH " " TO YOUR OWN RG NAME/TENANTID/ETC RESPECTIVELY





