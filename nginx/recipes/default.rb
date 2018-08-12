#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe "apt"

package 'nginx' do
    action :install
end

service 'nginx' do
    action [ :enable, :start]
end

#The cookbook_file resource tells Chef that this file is available within the cookbook iteself
#and can be transferred as-is to the location. Chef looks for this file within the "files/default"
#subdirectory in the cookbook
cookbook_file "user/share/nginx/www/index.html" do
    source "index.html"
    mode "0644"
end


