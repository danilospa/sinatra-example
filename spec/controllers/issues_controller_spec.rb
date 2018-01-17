# frozen_string_literal: true

require './app/controllers/issues_controller'
require_relative './shared_examples'

RSpec.describe IssuesController do
  let(:body) { JSON.parse(last_response.body) }

  describe 'get /issues' do
    context 'when user is logged in' do
      before do
        stub_request(:get, "#{Clients::Github::BASE_URL}/repos/Evino/vidal/issues").to_return(body: 'issues list')
        Infrastructure::RedisSession.set('auth hash', 'value')
        get '/issues', nil, 'HTTP_AUTHORIZATION' => 'auth hash'
      end

      it 'returns status code 200' do
        expect(last_response.status).to eq 200
      end

      it 'returns correct body' do
        expect(body).to eq 'issues' => 'issues list'
      end
    end

    context 'when user is not logged in' do
      include_examples 'user not logged in', :get, '/issues'
    end
  end
end
