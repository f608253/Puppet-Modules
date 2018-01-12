require 'spec_helper'
describe 'ntpconfig' do

  context 'with defaults for all parameters' do
    it { should contain_class('ntpconfig') }
  end
end
