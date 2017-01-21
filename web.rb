require 'sinatra/base'

module SlackMathbot
  class Web < Sinatra::Base
    get '/' do
      'El Psy Tuturu?'
    end
  end
end
