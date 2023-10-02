Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Descargar e instalar Chrome Remote Desktop Host
$ChromeRemoteDesktopInstaller = $env:TEMP + '\chromeremotedesktophost.msi'
Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $ChromeRemoteDesktopInstaller
Start-Process $ChromeRemoteDesktopInstaller -Wait
Remove-Item $ChromeRemoteDesktopInstaller

# Descargar e instalar Chrome
$ChromeInstaller = $env:TEMP + '\chrome_installer.exe'
Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $ChromeInstaller
Start-Process -FilePath $ChromeInstaller -Args '/install' -Verb RunAs -Wait
Remove-Item $ChromeInstaller

# Iniciar Chrome y acceder a la página web deseada
Start-Process 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList 'https://twitch.tv/ijoshc'
