#
# Cookbook:: cr_gitkraken
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.

case node['platform_family']
when 'debian'
  tmp_file = "#{Chef::Config['file_cache_path']}/gitkraken.deb"
  remote_file 'gitkraken.deb' do
    path tmp_file
    source "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
  end

  dpkg_package 'gitkraken' do
    source tmp_file
    action :install
  end

when 'windows'
  windows_package 'GitKraken' do
    source 'https://api.gitkraken.dev/releases/production/windows/x64/active/GitKrakenSetup.exe'
    options '-s'
    installer_type :custom
    action :install
  end
  
end