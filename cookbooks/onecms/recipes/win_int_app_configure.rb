# Cookbook:: OneCMS
# Recipe:: win_int_app_svr_configure
#
# Copyright:: 2018, Charles Harvey, All Rights Reserved.

windows_feature ['NET-Framework-45-ASPNET', 'NET-Framework-45-Core', 'NET-Framework-45-Features', 'NET-Framework-Features', 'NET-WCF-Services45', 'NET-WCF-TCP-PortSharing45', 'Web-App-Dev', 'Web-Asp-Net', 'Web-Asp-Net45', 'Web-Common-Http', 'Web-Default-Doc', 'Web-Dir-Browsing', 'Web-Filtering', 'Web-Health', 'Web-Http-Errors', 'Web-Http-Logging', 'Web-ISAPI-Ext', 'Web-ISAPI-Filter', 'Web-Mgmt-Console', 'Web-Mgmt-Tools', 'Web-Net-Ext', 'Web-Net-Ext45', 'Web-Performance', 'Web-Security', 'Web-Server', 'Web-Stat-Compression', 'Web-Static-Content', 'Web-WebServer'] do
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

directory "#{node['iis']['docroot']}/OneCMS-CSS-App" do
  action :create
end

iis_pool 'OneCMS-CSS-App' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-CSS-App' do
  protocol :http
  port 9525
  path "#{node['iis']['docroot']}/OneCMS-CSS-App"
  application_pool 'OneCMS-CSS-App'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-CSS-App/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-CSS-Report" do
  action :create
end

iis_pool 'OneCMS-CSS-Report' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-CSS-Report' do
  protocol :http
  port 9625
  path "#{node['iis']['docroot']}/OneCMS-CSS-Report"
  application_pool 'OneCMS-CSS-Report'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-CSS-Report/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-CSS-RESTApp" do
  action :create
end

iis_pool 'OneCMS-CSS-RESTApp' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-CSS-RESTApp' do
  protocol :http
  port 9575
  path "#{node['iis']['docroot']}/OneCMS-CSS-RESTApp"
  application_pool 'OneCMS-CSS-RESTApp'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-CSS-RESTApp/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-Prod-App" do
  action :create
end

iis_pool 'OneCMS-Prod-App' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-Prod-App' do
  protocol :http
  port 9500
  path "#{node['iis']['docroot']}/OneCMS-Prod-App"
  application_pool 'OneCMS-Prod-App'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-Prod-App/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-Prod-AppExt" do
  action :create
end

iis_pool 'OneCMS-Prod-AppExt' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-Prod-AppExt' do
  protocol :http
  port 9650
  path "#{node['iis']['docroot']}/OneCMS-Prod-AppExt"
  application_pool 'OneCMS-Prod-AppExt'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-Prod-AppExt/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-Prod-AppExt" do
  action :create
end

iis_pool 'OneCMS-Prod-AppExt' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-Prod-AppExt' do
  protocol :http
  port 9650
  path "#{node['iis']['docroot']}/OneCMS-Prod-AppExt"
  application_pool 'OneCMS-Prod-AppExt'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-Prod-AppExt/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-Prod-report" do
  action :create
end

iis_pool 'OneCMS-Prod-report' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-Prod-report' do
  protocol :http
  port 9600
  path "#{node['iis']['docroot']}/OneCMS-Prod-report"
  application_pool 'OneCMS-Prod-report'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-Prod-report/Default.htm" do
  source 'default.htm.erb'
end

directory "#{node['iis']['docroot']}/OneCMS-Prod-RestApp" do
  action :create
end

iis_pool 'OneCMS-Prod-RestApp' do
  runtime_version "4.0"
  pipeline_mode :Integrated
  action :add
end

iis_site 'OneCMS-Prod-RestApp' do
  protocol :http
  port 9550
  path "#{node['iis']['docroot']}/OneCMS-Prod-RestApp"
  application_pool 'OneCMS-Prod-RestApp'
  action [:add,:start]
end

template "#{node['iis']['docroot']}/OneCMS-Prod-RestApp/Default.htm" do
  source 'default.htm.erb'
end