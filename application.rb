# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    enable :logging
  end
end
