# frozen_string_literal: true

require 'cgi'

module PayPalCheckoutSdk
  module PartnerReferrals
    # Makes a GET request to fetch merchant integration status from PayPal's Partner Referrals API
    # @see https://developer.paypal.com/docs/api/partner-referrals/v2/#partner-referrals_read
    class PartnerReferralSellerStatusGetRequest
      attr_reader :path, :headers, :body, :verb

      # @param partner_id [String] PayPal partner ID
      # @param merchant_id [String] PayPal merchant ID
      def initialize(partner_id:, merchant_id:)
        @verb = 'GET'
        @body = nil
        @headers = { 'Content-Type' => 'application/json' }
        @path = build_path(partner_id, merchant_id)
      end

      private

      # Builds the API endpoint path with encoded parameters
      # @param partner_id [String]
      # @param merchant_id [String]
      # @return [String] the formatted path
      def build_path(partner_id, merchant_id)
        template = '/v1/customer/partners/%<partner_id>s/merchant-integrations/%<merchant_id>s?'

        format(
          template,
          partner_id: CGI.escape(partner_id.to_s),
          merchant_id: CGI.escape(merchant_id.to_s)
        )
      end
    end
  end
end
