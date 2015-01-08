require 'profitrolly/version'
require 'profitrolly/client'

module Profitrolly
  def self.client(token:)
    Client.new(token: token)
  end
end
