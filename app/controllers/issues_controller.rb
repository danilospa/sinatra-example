# frozen_string_literal: true

require './app/clients/github/issues'

class IssuesController < Application
  before '*' do
    authorize!
  end

  get '/issues' do
    begin
      issues = Clients::Github::Issues.new.all(request.params)
      { issues: issues }.to_json
    rescue SocketError
      halt 424, { status: 'GITHUB_DEPENDENCY_FAILED' }.to_json
    end
  end

  post '/issues' do
    begin
      response = Clients::Github::Issues.new.create(request.params)
      response.to_json
    rescue SocketError
      halt 424, { status: 'GITHUB_DEPENDENCY_FAILED' }.to_json
    end
  end
end
