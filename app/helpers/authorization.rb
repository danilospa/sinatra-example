# frozen_string_literal: true

require './app/services/session'

module Helpers
  module Authorization
    def authorize!
      authorization_hash = request.env['HTTP_AUTHORIZATION']
      halt 401, { status: 'NOT_AUTHENTICATED' }.to_json unless Services::Session.new.validate_hash(authorization_hash)
    end
  end
end
