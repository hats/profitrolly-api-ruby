require 'json'
require 'faraday'
require 'faraday_middleware'

module Profitrolly
  class Client

    @@host = 'http://profitrolly.com/merchant_api/v1'.freeze
    @@methods = {
        activate: 'activate',
        available: 'coupons'
    }.freeze

    def initialize(token:)
      @token = token
    end

    def activate(code:)
      @data = { token: @token, code: code }
      resp = post :activate
      resp.body
    rescue Faraday::ResourceNotFound => error
      { error: error.message, code: 404 }
    rescue Faraday::ClientError => error
      { error: error.message, code: 401 }
    end

    def available?(code)
      resp = get :available, code
      resp.body.has_key? ('code') and resp.body.has_key? ('owned_at') and resp.body.has_key? ('used_at')\
      and resp.body['code'] == code and Time.parse(resp.body['owned_at']) < Time.now and resp.body['used_at'] == ''
    end

    private

    def connection
      Faraday.new(url: @@host) do |faraday|
        faraday.request  :json
        faraday.response :json, :content_type => /\bjson$/
        # faraday.response :logger
        # faraday.response :raise_error
        faraday.adapter  Faraday.default_adapter
      end
    end

    def post(method)
      connection.post do |req|
        req.url "#{@@methods[method]}"
        req.body = @data.to_json
      end
    end

    def get(method, parameter)
      connection.get do |req|
        req.url "#{@@methods[method]}/#{parameter}", token: @token
      end
    end

  end
end
