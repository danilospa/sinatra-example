# frozen_string_literal: true

require './app/clients/github/issues'

class IssuesController < Application
  before '*' do
    authorize!
  end

  get '/issues' do
    issues = Clients::Github::Issues.new.all(request.params)
    { issues: issues }.to_json
  end

  post '/issues' do
    response = Clients::Github::Issues.new.create(request.params)
    response.to_json
  end
end
