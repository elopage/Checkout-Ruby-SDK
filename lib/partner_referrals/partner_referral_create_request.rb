# frozen_string_literal: true

# NOTE: https://developer.paypal.com/docs/api/partner-referrals/v2/#partner-referrals_create

module PayPalCheckoutSdk
  module PartnerReferrals
    class PartnerReferralCreateRequest # rubocop:disable Style/Documentation
      attr_accessor :path, :body, :headers, :verb

      def initialize
        @headers = {}
        @body = nil
        @verb = 'POST'
        @path = '/v2/customer/partner-referrals?'

        @headers['Content-Type'] = 'application/json'
      end

      def request_body(order_params)
        @body = order_params
      end
    end
  end
end
