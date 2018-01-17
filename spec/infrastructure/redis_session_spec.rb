# frozen_string_literal: true

require './app/infrastructure/redis_session'

RSpec.describe Infrastructure::RedisSession do
  it 'extends redis methods' do
    Infrastructure::RedisMethods.instance_methods do |method|
      expect(described_class.response_to?(method)).to be true
    end
  end

  it 'sets correct redis url' do
    expect(Infrastructure::RedisSession.url).to eq "redis://#{ENV['REDIS_URL']}/10"
  end
end
