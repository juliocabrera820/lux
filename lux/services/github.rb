require 'httparty'

module Lux
  module Services
    class Github
      BASE_URL = 'https://api.github.com'.freeze
      def self.find_user(user)
        HTTParty.get("#{BASE_URL}/users/#{user}")
      end
    end
  end
end
