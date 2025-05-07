# frozen_string_literal: true

module PayPalCheckoutSdk
  module Vault
    class VaultPaymentTokenCreateRequest # rubocop:disable Style/Documentation
      attr_accessor :path, :body, :headers, :verb

      # @param payment_token_id [String] The ID of the payment token to retrieve
      # @raise [ArgumentError] if payment_token_id is nil
      def initialize(payment_token_id:)
        raise ArgumentError, 'payment_token_id is required' if payment_token_id.nil?

        @headers = {}
        @body = nil
        @verb = 'GET'
        @path = '/v3/vault/payment-tokens/{payment_token_id}?'

        @path = @path.gsub("{payment_token_id}", CGI::escape(payment_token_id.to_s))
        @headers['Content-Type'] = 'application/json'
      end
    end
  end
end
