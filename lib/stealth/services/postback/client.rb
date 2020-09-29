# coding: utf-8
# frozen_string_literal: true

require 'rest-client'

require 'stealth/services/postback/message_handler'
require 'stealth/services/postback/reply_handler'
require 'stealth/services/postback/setup'

module Stealth
  module Services
    module Postback
      class Client < Stealth::Services::BaseClient
        attr_reader :reply, :postback_url

        def initialize(reply:)
          super
          @postback_url = Stealth.config.postback.postback_url
          @access_id = Stealth.config.postback.access_id
          @secret_key = Stealth.config.postback.secret_key
        end

        def transmit
          # Don't transmit anything for delays
          # Could send something as typing indicator
          return true if reply.blank?
          
          send_signed_request

          message = "Transmitting. Response: #{reply[:body]}. To: #{reply[:to]}. Type: #{reply[:type]}"
          Stealth::Logger.l(topic: 'postback', message: message)
        end

        private

        def send_signed_request
          signed_request = ApiAuth.sign!(request, @access_id, @secret_key)
          signed_request.execute
        rescue RestClient::ExceptionWithResponse => e
          Stealth::Logger.l(topic: 'postback', message: "Error Transmitting. Response: #{e.response}")
        end

        def request
          RestClient::Request.new(
            url: postback_url,
            method: :post,
            payload: reply.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
        end
      end
    end
  end
end
