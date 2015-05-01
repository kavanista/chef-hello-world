#
# Cookbook Name:: HelloWorld
# Recipe:: default
#
# Copyright (C) 2015 John Kavanagh
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'apache2::default'
include_recipe 'apache2::mod_php5'

# Cook script to resolve broken file descriptors
cookbook_file "/root/fd.sh" do
  source "fd.sh"
  mode 0755
end

# Cook script to fix resolv.conf
cookbook_file "/root/resolv.sh" do
  source "resolv.sh"
  mode 0755
end


# Execute script to free space by resolving broken file descriptors
#execute "Remove broken file desciptors for named" do
#  command "bash /tmp/fd.sh"
#  returns [0, 1]
#end

# Enable HelloWord site in apache
web_app node['web_application']['name'] do
  template "#{node['web_application']['config']}.erb"
end

# Create the webroot
directory node['apache']['docroot_dir'] do
  recursive true
end

# Write out index.php
cookbook_file "#{node['apache']['docroot_dir']}/index.php" do
  source 'index.php'
  mode '0644'
  owner node['apache']['user']
  group node['apache']['group']
end
