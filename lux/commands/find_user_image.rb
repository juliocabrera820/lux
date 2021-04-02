# frozen_string_literal: true

require 'httparty'
require 'lux/services/github'
require 'lux/utils/parser'
require 'lux/utils/block_builder'

module Lux
  module Commands
    class FindUserImage < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) image$/) do |_client, data, match|
        user = match[:user]
        response = Services::Github.find_user(user)
        user_data = Utils::Parser.parse_response(response)
        user_image_block = Utils::BlockBuilder.build_user_image_block(user_data)
        slack_client = Slack::Web::Client.new
        slack_client.chat_postMessage(channel: data.channel, blocks: user_image_block)
      end
    end
  end
end
