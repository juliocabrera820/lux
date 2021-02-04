# frozen_string_literal: true

require 'httparty'

module Lux
  module Commands
    class FindUser < SlackRubyBot::Commands::Base
      match /^find (?<user>\w*) github profile$/ do |client, data, match|
        response = HTTParty.get("https://api.github.com/users/#{match[:user]}")
        user = JSON.parse(response.body)
        client.say(channel: data.channel, text: user['html_url'])
      end
    end
  end
end