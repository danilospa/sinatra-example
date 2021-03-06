# frozen_string_literal: true

require './app/clients/github/issues'

RSpec.describe Clients::Github::Issues do
  subject { described_class.new }

  it 'sets correct base uri' do
    expect(described_class.base_uri).to eq Clients::Github::BASE_URL
  end

  describe '#all' do
    before do
      allow(Clients).to receive(:parse_response)
    end

    it 'performs get to correct path' do
      expect(described_class).to receive(:get).with('/repos/Evino/vidal/issues', any_args)
      subject.all
    end

    it 'performs get with correct options when no parameter is given' do
      expected_options = Clients::Github::DEFAULT_OPTIONS.merge(query: {})
      expect(described_class).to receive(:get).with(any_args, expected_options)
      subject.all
    end

    it 'performs get with correct options when a parameter is given ' do
      expected_options = Clients::Github::DEFAULT_OPTIONS.merge(query: { param1: 'value' })
      expect(described_class).to receive(:get).with(any_args, expected_options)
      subject.all(param1: 'value')
    end

    it 'parses response' do
      allow(described_class).to receive(:get).and_return('github response')
      expect(Clients).to receive(:parse_response).with('github response')
      subject.all
    end
  end

  describe '#create' do
    before do
      allow(Clients).to receive(:parse_response)
    end

    it 'performs post to correct path' do
      expect(described_class).to receive(:post).with('/repos/Evino/vidal/issues', any_args)
      subject.create({})
    end

    it 'performs get with correct options' do
      expected_options = Clients::Github::DEFAULT_OPTIONS.merge(body: { param1: 'value' }.to_json)
      expect(described_class).to receive(:post).with(any_args, expected_options)
      subject.create(param1: 'value')
    end

    it 'parses response' do
      allow(described_class).to receive(:post).and_return('github response')
      expect(Clients).to receive(:parse_response).with('github response')
      subject.create({})
    end
  end
end
