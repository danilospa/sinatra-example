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
end
