
describe 'rightlink10::enable' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.set['rightlink10']['refresh_token'] = '1234'
    runner.converge('rightlink10::enable')
  end

    it 'enable rightlink' do
       expect(chef_run).to run_execute('enable rightlink')
     end
end
