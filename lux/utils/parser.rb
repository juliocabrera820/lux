# frozen_string_literal: true

module Lux
  module Utils
    Parser = lambda do
      parse_response = ->(response) { JSON.parse(response.body) }
      { parse_response: parse_response }
    end
  end
end
