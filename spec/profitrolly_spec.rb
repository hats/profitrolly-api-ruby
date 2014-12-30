require File.expand_path('../spec_helper', __FILE__)

describe Profitrolly do

  describe '.client' do
    it 'should be a Profitrolly::Client' do
      expect(Profitrolly.client(token: 'some-token')).to be_a Profitrolly::Client
    end
  end
end