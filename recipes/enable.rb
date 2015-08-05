remote_file '/tmp/rightlink.enable.sh' do
  source 'https://rightlink.rightscale.com/rll/10.1.4/rightlink.enable.sh'
  mode 0755
  action :create
end

execute 'enable rightlink' do
  command "/tmp/rightlink.enable.sh -k  #{node['rightlink10']['refresh_token']}  -n #{node['rightlink10']['server_name']}  -r #{node['rightlink10']['servertemplate_href']}  -c #{node['rightlink10']['cloud']} -d #{node['rightlink10']['deployment_name']} "

end
