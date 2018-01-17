# frozen_string_literal: true

require 'redis'

module Infrastructure
  module RedisMethods
    attr_reader :url

    def connect
      @redis = Redis.new(url: url)
    end

    def exists(key)
      @redis.exists(key)
    end

    def set(key, value)
      @redis.set(key, value)
    end

    def del(key)
      @redis.del(key)
    end

    def config(key, value)
      instance_variable_set('@' + key.to_s, value)
    end
  end
end
