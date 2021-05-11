# frozen_string_literal: true

module Lux
  module Utils
    class BlockKitElements
      def self.image(url, text)
        {
          "type": 'image',
          "image_url": url,
          "alt_text": text
        }
      end

      def self.markdown(text)
        {
          "type": 'mrkdwn',
          "text": text
        }
      end
    end
  end
end
