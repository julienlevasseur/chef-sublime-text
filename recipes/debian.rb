#
# Cookbook:: sublime_text
# Recipe:: debian
#
# Copyright:: 2017, Julien Levasseur, All Rights Reserved.

if node['sublime_text']['state'] == :present
  # Requirement:
  package 'apt-transport-https'

  # Repository management
  bash 'import sublime-text repo key' do
    user 'root'
    cwd '/tmp'
    code <<-EOH
      wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
    EOH
    not_if 'apt-key list|grep -i sublime'
  end

  template '/etc/apt/sources.list.d/sublime-text.list' do
    cookbook 'sublime_text'
    source 'repo.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      uri: node['sublime_text']['repo']['uri'],
      distribution: node['sublime_text']['repo']['distribution']
    )
  end

  apt_update 'update' do
    action :update
    not_if 'dpkg -l|grep -i sublime'
  end

  # Package management
  package 'sublime-text' do # ~FC009
    action :install
  end

elsif node['sublime_text']['state'] == :absent

  file '/etc/apt/sources.list.d/sublime-text.list' do
    action :delete
  end

  package 'sublime-text' do
    action :remove
  end
end
