# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'dotenv/load'
require './app/infrastructure/redis_session'
require './app/helpers/authorization'
require './app/extensions/hash'

Infrastructure::RedisSession.connect

class Application < Sinatra::Base
  helpers Helpers::Authorization

  configure :development do
    require 'pry'
    register Sinatra::Reloader
  end

  configure :production, :development do
    enable :logging
  end
end
