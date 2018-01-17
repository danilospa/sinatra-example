# frozen_string_literal: true

require './app/services/session'

class IssuesController < Application
  before '*' do
    authorize!
  end

  get '/issues' do
    { status: 'OK' }.to_json
  end
end
