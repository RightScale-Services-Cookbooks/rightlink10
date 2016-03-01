remote_file "#{Chef::Config[:file_cache_path]}/rightlink.enable.sh" do
  source "https://rightlink.rightscale.com/rll/#{node['rightlink10']['version']}/rightlink.enable.sh"
  mode 0755
  action :create
end

execute 'enable rightlink' do
  command "#{Chef::Config[:file_cache_path]}/rightlink.enable.sh -k  #{node['rightlink10']['refresh_token']}  -n \"#{node['rightlink10']['server_name']}\"  -r #{node['rightlink10']['servertemplate_href']}  -c #{node['rightlink10']['cloud']} -d \"#{node['rightlink10']['deployment_name']}\" "
  not_if {File.exists?('/var/lib/rightscale-identity') }
end
