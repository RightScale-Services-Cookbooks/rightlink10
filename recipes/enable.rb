remote_file "#{Chef::Config[:file_cache_path]}/rightlink.enable.sh" do
  source "https://rightlink.rightscale.com/rll/#{node['rightlink10']['version']}/rightlink.enable.sh"
  mode 0755
  action :create
end

ruby_block "RightLink Enable" do
  block do
    if node['rightlink10']['server_name'] == 'nil'
      notifies :run, 'execute[enable-rightlink]', :immediately
    else
      notifies :run, 'execute[enable-rightlinkr-with-server-name]', :immediately
    end
  end
  action :run
end

execute 'enable-rightlink' do
  command "#{Chef::Config[:file_cache_path]}/rightlink.enable.sh -a #{node['rightlink10']['api_endpoint']} -k  #{node['rightlink10']['refresh_token']}  -r #{node['rightlink10']['servertemplate_href']}  -c #{node['rightlink10']['cloud']} -d \"#{node['rightlink10']['deployment_name']}\" "
  not_if {File.exists?('/var/lib/rightscale-identity') }
  action :nothing
end

execute 'enable-rightlinkr-with-server-name' do
  command "#{Chef::Config[:file_cache_path]}/rightlink.enable.sh -a #{node['rightlink10']['api_endpoint']} -k  #{node['rightlink10']['refresh_token']}  -n \"#{node['rightlink10']['server_name']}\"  -r #{node['rightlink10']['servertemplate_href']}  -c #{node['rightlink10']['cloud']} -d \"#{node['rightlink10']['deployment_name']}\" "
  not_if {File.exists?('/var/lib/rightscale-identity') }
  action :nothing
end
