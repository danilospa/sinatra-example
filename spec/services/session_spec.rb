# frozen_string_literal: true

require './app/services/session'

RSpec.describe Services::Session do
  let(:redis_session) { double('RedisSession') }
  subject { described_class.new(redis_session: redis_session) }

  describe '#validate_hash' do
    it 'verifies existance of item on redis' do
      allow(redis_session).to receive(:exists).and_return('item existance')
      expect(subject.validate_hash('hash')).to be 'item existance'
    end

    it 'verifies existance for specified hash' do
      expect(redis_session).to receive(:exists).with('hash')
      subject.validate_hash('hash')
    end
  end
end
