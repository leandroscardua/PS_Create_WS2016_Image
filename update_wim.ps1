# enter on teh WISM/ADK folder with the corrent DISM file.

cd "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM"

# Create a folder to mount the WIM

md C:\mount\Windows

# Mount the WIM

.\dism.exe /Mount-Image /ImageFile:"C:\WS2016\OS\sources\install.wim" /Index:2 /MountDir:C:\mount\Windows


# Install Features and Roles


.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:C:\WS2016\OS\sources\sxs

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:NetFx4 /All

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-WebServerRole /All

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-DefaultDocument /All

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-ASPNET45 /All

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:TelnetClient /All

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-ApplicationInit /FeatureName:IIS-NetFxExtensibility /FeatureName:IIS-ASPNET /FeatureName:IIS-CGI /FeatureName:IIS-ASP /FeatureName:IIS-LoggingLibraries

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-RequestMonitor /FeatureName:IIS-HttpTracing /FeatureName:IIS-ODBCLogging /FeatureName:IIS-CertProvider /FeatureName:IIS-DigestAuthentication

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-DigestAuthentication /FeatureName:IIS-ClientCertificateMappingAuthentication /FeatureName:IIS-IISCertificateMappingAuthentication /FeatureName:IIS-URLAuthorization /FeatureName:IIS-IPSecurity

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-HttpCompressionDynamic /FeatureName:IIS-WebServerManagementTools /FeatureName:IIS-ManagementScriptingTools 

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:IIS-LegacySnapIn /FeatureName:IIS-IIS6ManagementCompatibility /FeatureName:IIS-Metabase /FeatureName:IIS-WMICompatibility /FeatureName:IIS-LegacyScripts

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:WCF-HTTP-Activation45 /FeatureName:WCF-TCP-Activation45 /FeatureName:WCF-HTTP-Activation /FeatureName:WCF-NonHTTP-Activation

.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:WAS-WindowsActivationService /FeatureName:WAS-ProcessModel /FeatureName:WAS-NetFxEnvironment /FeatureName:WAS-ConfigurationAPI 
   
.\dism.exe /Image:C:\mount\Windows /Enable-Feature /FeatureName:Smtpsvc-Admin-Update-Name /FeatureName:Smtpsvc-Service-Update-Name  

.\dism.exe /Image:C:\mount\Windows /Disable-Feature /FeatureName:IIS-CustomLogging

.\dism.exe /Image:C:\mount\Windows /Disable-Feature /FeatureName:IIS-ManagementService


.\dism.exe  /Image:C:\mount\Windows /Get-Features /Format:Table


# Install the newest windows updates, 16 is required and 27 is the newest.

.\dism.exe /Add-Package /Image:C:\mount\Windows /PackagePath:C:\WS2016\Updates\Required\windows10.0-kb4132216-x64_9cbeb1024166bdeceff90cd564714e1dcd01296e.msu /LogPath:AddPackage.log

.\dism.exe /Add-Package /Image:C:\mount\Windows /PackagePath:C:\WS2016\Updates\New\windows10.0-kb4457127-x64_53e4351d1e0233b3e55ed7fd70b6dca54b0ab878.msu /LogPath:AddPackage.log

# umont the image and commit the changes.

.\dism.exe /Unmount-Image /MountDir:C:\mount\Windows /Commit