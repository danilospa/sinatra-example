# frozen_string_literal: true

require './app/infrastructure/redis_methods'

RSpec.shared_examples 'verifies function as proxy' do |method, *opts|
  it 'calls redis with correct parameter' do
    expect(redis).to receive(method).with(*opts)
    klass.send(method, *opts)
  end

  it 'returns correct value' do
    allow(redis).to receive(method).and_return('return value')
    expect(klass.send(method, *opts)).to eq 'return value'
  end
end

RSpec.describe Infrastructure::RedisMethods do
  let(:klass) do
    Class.new do
      extend Infrastructure::RedisMethods
      config :url, 'redis base url'
    end
  end

  describe '#connect' do
    it 'connects to redis on specified url' do
      expect(Redis).to receive(:new).with(url: 'redis base url')
      klass.connect
    end

    it 'assign redis connection to redis variable' do
      allow(Redis).to receive(:new).and_return('redis instance')
      klass.connect
      expect(klass.instance_variable_get(:@redis)).to be 'redis instance'
    end
  end

  describe '#exists, #set, #del' do
    let(:redis) { double('Redis') }
    before { klass.instance_variable_set(:@redis, redis) }

    include_examples 'verifies function as proxy', :exists, 'redis key'
    include_examples 'verifies function as proxy', :set, 'key', 'value'
    include_examples 'verifies function as proxy', :del, 'key'
  end

  describe '#config' do
    it 'sets correct value as instance variable for given key' do
      klass.config('key', 'value')
      val = klass.instance_variable_get('@key')
      expect(val).to eq 'value'
    end
  end
end
