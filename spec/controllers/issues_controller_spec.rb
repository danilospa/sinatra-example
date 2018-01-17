# frozen_string_literal: true

require './app/controllers/issues_controller'
require_relative './shared_examples'

RSpec.describe IssuesController do
  let(:body) { JSON.parse(last_response.body) }

  describe 'get /issues' do
    context 'when user is logged in' do
      before do
        stub_request(:get, "#{Clients::Github::BASE_URL}#{Clients::Github::Issues::PATH}?param=value")
          .to_return(body: 'issues list')
        Infrastructure::RedisSession.set('auth hash', 'value')
        get '/issues', { param: 'value' }, 'HTTP_AUTHORIZATION' => 'auth hash'
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

    context 'when there is a connection error with github' do
      before do
        allow_any_instance_of(Clients::Github::Issues).to receive(:all).and_raise(SocketError)
      end

      include_examples 'github dependency fail', :get, '/issues'
    end
  end

  describe 'post /issues' do
    context 'when user is logged in' do
      before do
        stub_request(:post, Clients::Github::BASE_URL + Clients::Github::Issues::PATH)
          .to_return(body: { field: 'value' }.to_json)
        Infrastructure::RedisSession.set('auth hash', 'value')
        post '/issues', { param: 'value' }, 'HTTP_AUTHORIZATION' => 'auth hash'
      end

      it 'returns status code 200' do
        expect(last_response.status).to eq 200
      end

      it 'returns correct body' do
        expect(body).to eq 'field' => 'value'
      end
    end

    context 'when user is not logged in' do
      include_examples 'user not logged in', :post, '/issues'
    end

    context 'when there is a connection error with github' do
      before do
        allow_any_instance_of(Clients::Github::Issues).to receive(:create).and_raise(SocketError)
      end

      include_examples 'github dependency fail', :post, '/issues'
    end
  end
end
