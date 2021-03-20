$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'

Dotenv.load

require 'lux'
require 'lux/web'

Thread.abort_on_exception = true
Thread.new do
  begin
    Lux::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run Lux::Web
