# frozen_string_literal: true

require 'lux/services/github'
require 'lux/utils/parser'
require 'lux/utils/block_kit_builder'

module Lux
  module Services
    class SlackService
      attr_reader :slack_client, :github_service, :parser, :data, :block_kit_builder,
                  :user, :client

      def initialize(data, user, client = nil)
        @slack_client = Slack::Web::Client.new
        @github_service = Services::Github.call
        @parser = Utils::Parser.call
        @block_kit_builder = Utils::BlockKitBuilder.new(user)
        @data = data
        @user = user
        @client = client
      end

      def user_image_response
        slack_client.chat_postMessage(channel: data.channel, blocks: block_kit_builder.success_user_image(user_data))
      end

      def user_response
        client.say(channel: data.channel, text: user_data['html_url'])
      end

      def user_data
        response = github_service[:find_user].call(user)
        if response['message'] == 'Not Found'
          slack_client.chat_postMessage(channel: data.channel, blocks: block_kit_builder.error)
        end
        parser[:parse_response].call(response)
      end
    end
  end
end
