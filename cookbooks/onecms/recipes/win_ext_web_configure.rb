# Cookbook:: OneCMS
# Recipe:: featureInternalAppServer
#
# Copyright:: 2018, Charles Harvey, All Rights Reserved.

windows_feature ['NET-Framework-45-ASPNET', 'NET-Framework-45-Core', 'NET-Framework-45-Features', 'NET-Framework-Features', 'NET-HTTP-Activation', 'NET-Non-HTTP-Activ', 'NET-WCF-HTTP-Activation45', 'NET-WCF-Services45', 'NET-WCF-TCP-Activation45', 'NET-WCF-TCP-PortSharing45', 'WAS', 'WAS-Config-APIs', 'WAS-NET-Environment', 'WAS-Process-Model', 'Web-App-Dev', 'Web-AppInit', 'Web-ASP', 'Web-Asp-Net', 'Web-Asp-Net45', 'Web-Common-Http', 'Web-Default-Doc', 'Web-Dir-Browsing', 'Web-Filtering', 'Web-Health', 'Web-Http-Errors', 'Web-Http-Logging', 'Web-ISAPI-Ext', 'Web-ISAPI-Filter', 'Web-Metabase', 'Web-Mgmt-Compat', 'Web-Mgmt-Console', 'Web-Mgmt-Tools', 'Web-Net-Ext', 'Web-Net-Ext45', 'Web-Performance', 'Web-Security', 'Web-Server', 'Web-Stat-Compression', 'Web-Static-Content', 'Web-WebServer', 'Web-Windows-Auth'] do
  action :install
  install_method :windows_feature_powershell
end

windows_service 'W3SVC' do
  action :enable
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content '<html>
  <body>
    <h1>Hello KinderCare - (win_ext_web_svr_configure)</h1>
  </body>
</html>'
end