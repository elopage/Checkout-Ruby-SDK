# frozen_string_literal: true

module PayPalCheckoutSdk
  module Vault
    class VaultPaymentToken # rubocop:disable Style/Documentation
      attr_accessor :path, :body, :headers, :verb

      def initialize
        @headers = {}
        @body = nil
        @verb = 'POST'
        @path = 'v3/vault/payment-tokens?'

        @headers['Content-Type'] = 'application/json'
      end

      def request_body(order_params)
        @body = order_params
      end
    end
  end
end
