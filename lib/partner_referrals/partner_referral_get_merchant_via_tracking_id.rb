# frozen_string_literal: true

require 'cgi'

module PayPalCheckoutSdk
  module PartnerReferrals
    # Makes a GET request to fetch merchant integration status via tracking ID from PayPal's Partner Referrals API
    # @see https://developer.paypal.com/docs/api/partner-referrals/v1/#merchant-integration_find
    class PartnerReferralGetMerchantViaTrackingIdRequest
      attr_reader :path, :headers, :body, :verb

      # @param partner_id [String] PayPal partner ID
      # @param tracking_id [String] PayPal tracking ID
      def initialize(partner_id:, tracking_id:)
        @verb = 'GET'
        @body = nil
        @headers = { 'Content-Type' => 'application/json' }
        @path = build_path(partner_id, tracking_id)
      end

      private

      # Builds the API endpoint path with encoded parameters
      # @param partner_id [String]
      # @param tracking_id [String]
      # @return [String] the formatted path
      def build_path(partner_id, tracking_id)
        template = '/v1/customer/partners/%<partner_id>s/merchant-integrations?tracking_id=%<tracking_id>s&'

        format(
          template,
          partner_id: CGI.escape(partner_id.to_s),
          tracking_id: CGI.escape(tracking_id.to_s)
        )
      end
    end
  end
end
