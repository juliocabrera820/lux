require 'sinatra/base'

module Lux
  class Web < Sinatra::Base
    get '/' do
      'Lux is alive'
    end
  end
end
