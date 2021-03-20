# frozen_string_literal: true

require 'httparty'

module Lux
  module Commands
    class FindUserImage < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) image$/) do |_client, data, match|
        response = HTTParty.get("https://api.github.com/users/#{match[:user]}")
        user = JSON.parse(response.body)
        slack_client = Slack::Web::Client.new
        user_image_block = [
          {
            "type": 'section',
            "text": {
              "type": 'mrkdwn',
              "text": 'user image'
            },
            "accessory": {
              "type": 'image',
              "image_url": user['avatar_url'],
              "alt_text": 'user'
            }
          }
        ]
        slack_client.chat_postMessage(channel: data.channel, blocks: user_image_block)
      end
    end
  end
end
