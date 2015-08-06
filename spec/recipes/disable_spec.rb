require 'spec_helper'

describe 'rightlink10::disable' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.set['rightlink10']['refresh_token'] = '1234'
    runner.converge('rightlink10::disable')
  end

    it 'disable rightlink' do
       expect(chef_run).to run_execute('disable rightlink')
     end
end
