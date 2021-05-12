# frozen_string_literal: true

require 'lux/utils/block_kit_elements'

module Lux
  module Utils
    class BlockKitBuilder
      attr_reader :block_kit_elements, :username, :emojis, :images

      def initialize(username)
        @username = username
        @block_kit_elements = Utils::BlockKitElements
        @emojis = { 'space_invader' => ':space_invader:', 'cry' => ':cry:' }
        @images = { 'cat' => 'https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg' }
      end

      def error
        [
          {
            "type": 'context',
            "elements": [
              block_kit_elements.markdown("Hubo un error #{emojis['cry']}"),
              block_kit_elements.image(cat_image_url, images['cat']),
              block_kit_elements.image(cat_image_url, images['cat']),
              block_kit_elements.image(cat_image_url, images['cat']),
              block_kit_elements.markdown("*#{username}* no existe #{emojis['space_invader']}")
            ]
          }
        ]
      end

      def success_user_image(user_data)
        [
          {
            "type": 'section',
            "text": block_kit_elements.markdown("Imagen de #{username}"),
            "accessory": block_kit_elements.image(user_data['avatar_url'], 'user image')
          }
        ]
      end
    end
  end
end
