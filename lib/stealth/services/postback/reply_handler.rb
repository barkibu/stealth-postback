# frozen_string_literal: true

module Stealth
  module Services
    module Postback
      class ReplyHandler < Stealth::Services::BaseReplyHandler
        attr_reader :recipient_id, :reply

        def text
          check_text_length

          response = { body: reply['text'] }

          if reply['buttons'].present?
            response['type'] = 'button'
            response = response.merge generate_buttons(buttons: reply['buttons'])
          end

          format_response(response)
        end

        # TODO: Not use custom reply type, as those won't be understood by existing integration (Fb - Twilio SMS)
        # Instead overwrite a normal one like text / cards ... so there is a fallback on other said integrations
        def event
          format_response(type: 'event', name: reply['name'], payload: reply['payload'].to_json)
        end

        def delay; end

        private

        def check_text_length
          return unless reply['text'].present? && reply['text'].size > 1600

          raise(ArgumentError, 'Text messages must be 1600 characters or less.')
        end

        def format_response(response)
          sender_info = { from: 'POSTBACK', to: recipient_id }
          response.merge(sender_info).symbolize_keys
        end

        def generate_buttons(buttons:)
          { buttons: buttons }
        end
      end
    end
  end
end
