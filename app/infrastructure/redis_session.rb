# frozen_string_literal: true

require './app/infrastructure/redis_methods'

module Infrastructure
  module RedisSession
    extend RedisMethods
    config :url, "redis://#{ENV['REDIS_URL']}/10"
  end
end
