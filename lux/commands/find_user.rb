# frozen_string_literal: true

require 'lux/services/github'
require 'lux/utils/parser'
require 'lux/utils/error_builder'

module Lux
  module Commands
    class FindUser < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) github profile$/) do |client, data, match|
        github_service = Services::Github.call
        user = match[:user]
        response = github_service[:find_user].call(user)
        if (response['message'] == "Not Found")
          error_block = Utils::ErrorBuilder.build_error_block(user)
          slack_client = Slack::Web::Client.new
          slack_client.chat_postMessage(channel: data.channel, blocks: error_block)
        end
        parser = Utils::Parser.call
        user_data = parser[:parse_response].call(response)
        client.say(channel: data.channel, text: user_data['html_url'])
      end
    end
  end
end
