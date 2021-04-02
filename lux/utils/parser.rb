module Lux
  module Utils
    class Parser
      def self.parse_response(response)
        JSON.parse(response.body)
      end
    end
  end
end
