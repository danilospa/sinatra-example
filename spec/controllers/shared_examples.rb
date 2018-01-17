# frozen_string_literal: true

RSpec.shared_examples 'user not logged in' do |method, path|
  before do
    Infrastructure::RedisSession.del('auth hash')
    send(method, path, nil, 'HTTP_AUTHORIZATION' => 'auth hash')
  end

  it 'returns status code 401' do
    expect(last_response.status).to eq 401
  end

  it 'returns correct body' do
    expect(body).to eq 'status' => 'NOT_AUTHENTICATED'
  end
end

RSpec.shared_examples 'github dependency fail' do |method, path|
  before do
    Infrastructure::RedisSession.set('auth hash', 'value')
    send(method, path, nil, 'HTTP_AUTHORIZATION' => 'auth hash')
  end

  it 'returns status code 424' do
    expect(last_response.status).to eq 424
  end

  it 'returns correct body' do
    expect(body).to eq 'status' => 'GITHUB_DEPENDENCY_FAILED'
  end
end
