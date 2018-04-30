# Cookbook:: OneCMS
# Recipe:: win_int_web_svr_configure
#
# Copyright:: 2018, Charles Harvey, All Rights Reserved.

windows_feature ['NET-Framework-45-ASPNET', 'NET-Framework-45-Core', 'NET-Framework-45-Features', 'NET-Framework-Core', 'NET-Framework-Features', 'NET-WCF-Services45', 'NET-WCF-TCP-PortSharing45', 'Web-App-Dev', 'Web-Asp-Net', 'Web-Asp-Net45', 'Web-Common-Http', 'Web-Default-Doc', 'Web-Dir-Browsing', 'Web-Filtering', 'Web-Health', 'Web-Http-Errors', 'Web-Http-Logging', 'Web-ISAPI-Ext', 'Web-ISAPI-Filter', 'Web-Mgmt-Console', 'Web-Mgmt-Service', 'Web-Mgmt-Tools', 'Web-Net-Ext', 'Web-Net-Ext45', 'Web-Performance', 'Web-Scripting-Tools', 'Web-Security', 'Web-Server', 'Web-Stat-Compression', 'Web-Static-Content', 'Web-WebServer'] do
  action :install
  install_method :windows_feature_powershell
end

windows_service 'W3SVC' do
  action :enable
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content '<html>
  <body>
    <h1>Hello KinderCare - (win_int_web_svr_configure.rb)</h1>
  </body>
</html>'
end