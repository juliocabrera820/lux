# frozen_string_literal: true

require 'lux/services/slack_service'

module Lux
  module Commands
    class FindImage < SlackRubyBot::Commands::Base
      match(/^find (?<user>\w*) image$/) do |_client, data, match|
        user = match[:user]
        Services::SlackService.new(data, user).user_image_response
      end
    end
  end
end
