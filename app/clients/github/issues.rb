# frozen_string_literal: true

require 'httparty'
require './app/clients/github'

module Clients
  module Github
    class Issues
      include HTTParty
      base_uri Clients::Github::BASE_URL

      def all(params = {})
        response = self.class.get('/repos/Evino/vidal/issues', Clients::Github::DEFAULT_OPTIONS.merge(query: params))
        Clients.parse_response(response)
      end
    end
  end
end
