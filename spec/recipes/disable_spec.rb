require 'spec_helper'

describe 'rightlink10::disable' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.set['rightlink10']['refresh_token'] = '1234'
    runner.converge('rightlink10::disable')
  end

    it 'disable rightlink' do
       resource = chef_run.execute('rightlink10::disable')
     end
end
