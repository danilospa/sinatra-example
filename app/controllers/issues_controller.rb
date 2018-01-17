# frozen_string_literal: true

require './app/clients/github/issues'
require './app/resources/issue'

class IssuesController < Application
  before '*' do
    authorize!
  end

  get '/issues' do
    begin
      issues = Clients::Github::Issues.new.all(request.params)
      {
        issues: issues.map { |issue| Resources::Issue.new(issue).to_h }
      }.to_json
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
