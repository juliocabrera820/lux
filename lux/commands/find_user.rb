# frozen_string_literal: true

require 'lux/services/slack_service'

module Lux
  module Commands
    class FindUser < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) profile$/) do |client, data, match|
        user = match[:user]
        Services::SlackService.new(data, user, client).user_response
      end
    end
  end
end
