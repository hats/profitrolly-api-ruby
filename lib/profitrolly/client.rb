require 'json'
require 'faraday'
require 'faraday_middleware'

module Profitrolly
  class Client

    @@host = 'http://profitrolly.com/merchant_api/v1'.freeze
    @@methods = {
        activate: 'activate'
    }.freeze

    def initialize(token:)
      @token = token
    end

    def activate(code:)
      @data = { token: @token, code: code }
      resp = response :activate
      resp.body
    rescue Faraday::ResourceNotFound => error
      { error: error.message, code: 404 }
    rescue Faraday::ClientError => error
      { error: error.message, code: 401 }
    end

    private

    def response(method)
      conn = Faraday.new(url: @@host) do |faraday|
        faraday.request  :json
        faraday.response :json, :content_type => /\bjson$/
        # faraday.response :logger
        # faraday.response :raise_error
        faraday.adapter  Faraday.default_adapter
      end
      conn.post do |req|
        req.url "#{@@methods[method]}"
        req.body = @data.to_json
      end
    end

  end
end
