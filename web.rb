require 'sinatra/base'

module SlackProg
  class Web < Sinatra::Base
    get '/' do
      'Ruby is good for you.'
    end
  end
end
