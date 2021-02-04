module Lux
  class Bot < SlackRubyBot::Bot
    help do
      title 'Lux Ruby Bot'
      desc 'This bot shows information about your github profile'

      command 'find <user> github profile' do
        title 'find github link'
        desc 'Link to your github profile'
      end
    end
  end
end