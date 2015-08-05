remote_file '/tmp/rightlink.disable.sh' do
  source 'https://rightlink.rightscale.com/rll/10.1.4/rightlink.disable.sh'
  mode 0755
  action :create
end

execute 'disable rightlink' do
  command "/tmp/rightlink.disable.sh -k  #{node[:rightlink10][:refresh_token]} -f"
end
