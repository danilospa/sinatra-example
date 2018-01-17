# frozen_string_literal: true

require './app/clients'

module Clients
  module Github
    BASE_URL = ENV['GITHUB_URL']
    DEFAULT_OPTIONS = {
      format: :plain,
      headers: {
        Authorization: "token #{ENV['GITHUB_AUTH_TOKEN']}",
        'user-agent': 'poc-ruby'
      }
    }.freeze
  end
end
