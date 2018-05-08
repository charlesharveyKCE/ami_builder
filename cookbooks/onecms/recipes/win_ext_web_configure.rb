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

# stop and delete the default site
iis_site 'Default Web Site' do
  action [:stop, :delete]
end

directory "#{node['iis']['docroot']}/CDN-Prod-web" do
  action :create
end

iis_pool 'CDN-Prod-Web' do
  runtime_version "2.0"
  pipeline_mode :Classic
  action :add
end

iis_site 'CDN-Prod-web' do
  protocol :http
  port 9050
  path "#{node['iis']['docroot']}/CDN-Prod-web"
  application_pool 'CDN-Prod-Web'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/CDN-Prod-web/Default.htm" do
  source 'default.htm.erb'
end


iis_pool 'Login-Web' do
  runtime_version "2.0"
  pipeline_mode :Classic
  action :add
end

directory "#{node['iis']['docroot']}/FCIL-Web" do
  action :create
end

iis_site 'Login-Web' do
  protocol :http
  port 9130
  path "#{node['iis']['docroot']}/FCIL-Web"
  application_pool 'Login-Web'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/FCIL-Web/Default.htm" do
  source 'default.htm.erb'
end

iis_pool 'ParentPortal-Prod-web' do
  runtime_version "2.0"
  pipeline_mode :Classic
  action :add
end

directory "#{node['iis']['docroot']}/ParentPortal-Prod-web" do
  action :create
end

iis_site 'ParentPortal-Pro' do
  protocol :http
  port 9030
  path "#{node['iis']['docroot']}/ParentPortal-Prod-web"
  application_pool ''
  action [:add,:start]
end

template "#{node['iis']['docroot']}/ParentPortal-Prod-web/Default.htm" do
  source 'default.htm.erb'
end