# frozen_string_literal: true

require 'httparty'
require './app/clients/github'

module Clients
  module Github
    class Issues
      include HTTParty
      base_uri Clients::Github::BASE_URL
      PATH = '/repos/Evino/vidal/issues'

      def all(params = {})
        response = self.class.get(PATH, Clients::Github::DEFAULT_OPTIONS.merge(query: params))
        Clients.parse_response(response)
      end

      def create(payload)
        response = self.class.post(PATH, Clients::Github::DEFAULT_OPTIONS.merge(body: payload.to_json))
        Clients.parse_response(response)
      end
    end
  end
end
