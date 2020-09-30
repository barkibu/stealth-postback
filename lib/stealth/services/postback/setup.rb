# frozen_string_literal: true

require 'stealth/services/postback/client'

module Stealth
  module Services
    module Postback
      class Setup
        class << self
          def trigger
            ApiAuth.generate_secret
          end
        end
      end
    end
  end
end
