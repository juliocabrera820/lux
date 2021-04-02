module Lux
  module Utils
    class BlockBuilder
      def self.build_user_image_block(user_data)
        [
          {
            "type": 'section',
            "text": {
              "type": 'mrkdwn',
              "text": 'user image'
            },
            "accessory": {
              "type": 'image',
              "image_url": user_data['avatar_url'],
              "alt_text": 'user'
            }
          }
        ]
      end
    end
  end
end