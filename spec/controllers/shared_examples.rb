# frozen_string_literal: true

RSpec.shared_examples 'user not logged in' do |path|
  before do
    Infrastructure::RedisSession.del('auth hash')
    get path, nil, 'HTTP_AUTHORIZATION' => 'auth hash'
  end

  it 'returns status code 401' do
    expect(last_response.status).to eq 401
  end

  it 'returns correct body' do
    body = JSON.parse(last_response.body)
    expect(body).to eq 'status' => 'NOT_AUTHENTICATED'
  end
end
