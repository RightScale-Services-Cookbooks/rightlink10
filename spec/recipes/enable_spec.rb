
describe 'rightlink10::enable' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.set['rightlink10']['refresh_token'] = '12344'
    runner.converge('rightlink10::enable')
  end

    it 'enable rightlink' do
       expect(chef_run).to run_execute('enable rightlink')
     end

     it 'creates a remote_file rightscale.enable.sh' do
       expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/rightlink.enable.sh")
     end


end
