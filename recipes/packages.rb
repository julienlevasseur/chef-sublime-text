#
# Cookbook:: chef-sublime-text
# Recipe:: packages
#
# Copyright:: 2018, Julien Levasseur, All Rights Reserved.

if node['sublime_text']['state'] == :present

  # Package Control plugin management
  node['sublime_text']['users'].each do |user|
    directory "/home/#{user}/.config/sublime-text-3" do
      owner user
      group user
    end

    directory "/home/#{user}/.config/sublime-text-3/Installed Packages" do
      action :create
      recursive true
    end

#    remote_file "/home/#{user}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package" do
#      source 'https://packagecontrol.io/Package%20Control.sublime-package'
#      owner user
#      group user
#      mode '0644'
#      action :create
#    end

    directory "/home/#{user}/.config/sublime-text-3/Packages/User" do
      action :create
      recursive true
    end

    template "/home/#{user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings" do
      cookbook 'sublime_text'
      source 'Package_Control.sublime-settings.erb'
      owner user
      group user
      mode '0644'
      variables(
        packages: node['sublime_text']['packages']
      )
    end
  end

  node['sublime_text']['users'].each do |user|
    node['sublime_text']['packages'].each do |pkg|
      remote_file "/home/#{user}/.config/sublime-text-3/Installed Packages/#{pkg['name']}.sublime-package" do
        source pkg['url']
        owner user
        group user
        mode '0644'
        action :create
      end
    end
  end
elsif node['sublime_text']['state'] == :absent

  node['sublime_text']['users'].each do |user|
    directory "/home/#{user}/.config/sublime-text-3" do
      action :delete
      recursive true
    end
  end
end
