Import-Module SharePointPnPPowerShellOnline


$Title = "CARD project template"
$Description = "Site template which is used to create CARD project sites in sharepoint"
$WebTemplate = "64" # 64 Team site template # 1 Team site (with group creation disabled) # 68 Communication site template # 69 Channel site template
# $ThumbnailUrl = "https://raw.githubusercontent.com/giuleon/CustomSiteTemplates/main/assets/ContosoPreview1.png"
# $PreviewImageUrl = "https://raw.githubusercontent.com/giuleon/CustomSiteTemplates/main/assets/ContosoPreview1.png"
$DomainName = "cardaieu"
$SiteTemplatePathInSharePoint = "/sites/Project"

Connect-PnPOnline -Url https://$DomainName-admin.sharepoint.com -UseWebLogin

# To get base Json file
# $Json = Get-PnPSiteScriptFromWeb -Url https://$DomainName.sharepoint.com$SiteTemplatePathInSharePoint -IncludeAll

# Json config file
$SiteScriptJson = ".\customConfig.json"
$Json = Get-Content $SiteScriptJson -Raw


# Make script
$SiteScript = Add-PnPSiteScript -Title $Title `
                                -Description $Description `
                                -Content $Json


Connect-SPOService -Url https://$DomainName-admin.sharepoint.com


Add-SPOSiteDesign `
  -Title $Title `
  -Description $Description `
  -SiteScripts $SiteScript.Id `
  -WebTemplate $WebTemplate
  # -ThumbnailUrl $ThumbnailUrl `
  # -PreviewImageUrl $PreviewImageUrl


# #Updating an existing one
# Get-SPOSiteDesign c765f79a-2bcf-4eec-923d-0b874ec57453
# Set-SPOSiteDesign -Identity 00f3961a-92f8-4fd2-bef8-20b59f23b5ef `
#     -ThumbnailUrl $ThumbnailUrl `
#     -PreviewImageUrl $PreviewImageUrl

# Get-SPOSiteScript $SiteScript.Id
# Set-SPOSiteScript -Identity $SiteScript.Id -Content $SiteScriptJsonContent


# How to delete template?

# Get-SPOSiteDesign
# Remove-SPOSiteDesign [ID_FROM_PREVIOUS_COMMAND]

