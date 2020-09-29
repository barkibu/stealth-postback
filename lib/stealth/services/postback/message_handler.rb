# frozen_string_literal: true

module Stealth
  module Services
    module Postback
      class MessageHandler < Stealth::Services::BaseMessageHandler
        attr_reader :service_message

        def coordinate
          Stealth::Services::HandleMessageJob.perform_async(
            'postback',
            params,
            headers
          )

          # Relay our acceptance
          [204, 'No Content']
        end

        def process
          @service_message = ServiceMessage.new(service: 'postback')
          service_message.sender_id = params['From'] || 'postback-user'
          service_message.message = params['Body']
          service_message.payload = payload

          service_message
        end

        private

        def payload
          return params['Payload'] if params['Payload'].is_a? Hash

          JSON.parse params['Payload']
        rescue StandardError
          {}
        end
      end
    end
  end
end
