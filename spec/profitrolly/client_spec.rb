require File.expand_path('../../spec_helper', __FILE__)

describe Profitrolly::Client do

  context '.new' do

    before do
      @client = Profitrolly::Client.new token: 'some-token'
    end

    describe '.activate' do
      it 'should return a hash with correct activation data' do
        expect(@client.activate(code: 'some-code')).to eq({ 'status' => 'ok', 'offer_id' => 234 })
      end
    end

  end
end
