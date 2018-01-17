# frozen_string_literal: true

require './app/clients'

RSpec.describe Clients do
  describe '.parse_response' do
    it 'returns hash when param in a json as string' do
      val = { field: 'value' }.to_json.to_s
      expect(described_class.parse_response(val)).to eq field: 'value'
    end

    it 'returns string itself when param in not a json as string' do
      val = 'string'
      expect(described_class.parse_response(val)).to eq 'string'
    end
  end
end
