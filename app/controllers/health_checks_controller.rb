# frozen_string_literal: true

require './application'

class HealthChecksController < Application
  get '/' do
    { status: 'OK' }.to_json
  end
end
