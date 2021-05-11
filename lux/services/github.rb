require 'httparty'

module Lux
  module Services
    Github = lambda do
      base_url = 'https://api.github.com'.freeze
      find_user = ->(user) { HTTParty.get("#{base_url}/users/#{user}") }
      { find_user: find_user }
    end
  end
end
