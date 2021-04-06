require 'cgi'

module PayPalCheckoutSdk
  module Disputes
    class DisputesListRequest
      attr_accessor :path, :body, :headers, :verb

      def initialize
        @headers = {}
        @body = nil
        @verb = "GET"
        @path = "/v1/customer/disputes"
        @headers["Content-Type"] = "application/json"
      end
    end
  end
end
