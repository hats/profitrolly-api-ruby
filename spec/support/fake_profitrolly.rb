require 'sinatra/base'

class FakeProfitrolly < Sinatra::Base

  post '/merchant_api/v1/activate' do
    json_response 200, 'activate.json'
  end

  get '/merchant_api/v1/coupons/AVAILABLE_CODE' do
    json_response 200, 'available.json'
  end

  get '/merchant_api/v1/coupons/UNAVAILABLE_CODE' do
    json_response 200, 'unavailable.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/../fixtures/' + file_name, 'rb').read
  end
end
