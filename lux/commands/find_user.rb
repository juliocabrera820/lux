# frozen_string_literal: true

require 'httparty'
require 'lux/services/github'
require 'lux/utils/parser'

module Lux
  module Commands
    class FindUser < SlackRubyBot::Commands::Base
      match /^find (?<user>\w*) github profile$/ do |client, data, match|
        user = match[:user]
        response = Services::Github.find_user(user)
        user_data = Utils::Parser.parse_response(response)
        client.say(channel: data.channel, text: user_data['html_url'])
      end
    end
  end
end
