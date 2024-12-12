# frozen_string_literal: true

require 'cgi'

# NOTE: https://developer.paypal.com/docs/api/partner-referrals/v2/#partner-referrals_read

module PayPalCheckoutSdk
  module PartnerReferrals
    class PartnerReferralGetRequest # rubocop:disable Style/Documentation
      attr_accessor :path, :body, :headers, :verb

      def initialize(partner_referral_id)
        @headers = {}
        @body = nil
        @verb = 'GET'
        @path = '/v2/customer/partner-referrals/{partner_referral_id}?'

        @path = @path.gsub('{partner_referral_id}', CGI.escape(partner_referral_id.to_s))
        @headers['Content-Type'] = 'application/json'
      end
    end
  end
end
