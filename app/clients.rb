# frozen_string_literal: true

module Clients
  def self.parse_response(body)
    JSON.parse(body, symbolize_names: true)
  rescue JSON::ParserError
    body
  end
end
