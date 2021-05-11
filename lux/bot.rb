module Lux
  class Bot < SlackRubyBot::Bot
    help do
      title 'Lux Ruby Bot'
      desc 'This bot shows information about your github profile'

      command 'find <user> profile' do
        title 'find github link'
        desc 'Link to your github profile'
      end
      command 'find <user> image' do
        title 'find user image'
        desc 'It shows github profile image'
      end
    end
  end
end
