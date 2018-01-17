# frozen_string_literal: true

require './app/infrastructure/redis_session'

module Services
  class Session
    def initialize(redis_session: Infrastructure::RedisSession)
      @redis_session = redis_session
    end

    def validate_hash(hash)
      @redis_session.exists(hash)
    end
  end
end
