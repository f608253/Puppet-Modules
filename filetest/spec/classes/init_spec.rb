require 'spec_helper'
describe 'filetest' do

  context 'with defaults for all parameters' do
    it { should contain_class('filetest') }
  end
end
