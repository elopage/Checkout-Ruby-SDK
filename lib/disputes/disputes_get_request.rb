require 'cgi'

module PayPalCheckoutSdk
  module Disputes
    class DisputesGetRequest
      attr_accessor :path, :body, :headers, :verb

      def initialize(dispute_id)
        @headers = {}
        @body = nil
        @verb = "GET"
        @path = "/v1/customer/disputes/{dispute_id}?"

        @path = @path.gsub("{dispute_id}", CGI::escape(dispute_id.to_s))
        @headers["Content-Type"] = "application/json"
      end
    end
  end
end
