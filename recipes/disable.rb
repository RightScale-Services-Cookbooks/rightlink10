remote_file "#{Chef::Config[:file_cache_path]}/rightlink.disable.sh" do
  source "https://rightlink.rightscale.com/rll/#{node['rightlink10']['version']}/rightlink.disable.sh"
  mode 0755
  action :create
end

execute 'disable rightlink' do
  command "#{Chef::Config[:file_cache_path]}/rightlink.disable.sh -k  #{node['rightlink10']['refresh_token']} -f"
end
