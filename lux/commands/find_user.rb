# frozen_string_literal: true

require 'lux/services/github'
require 'lux/utils/parser'

module Lux
  module Commands
    class FindUser < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) github profile$/) do |client, data, match|
        github_service = Services::Github.call
        user = match[:user]
        response = github_service[:find_user].call(user)
        parser = Utils::Parser.call
        user_data = parser[:parse_response].call(response)
        client.say(channel: data.channel, text: user_data['html_url'])
      end
    end
  end
end
