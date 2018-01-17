# frozen_string_literal: true

require './app/extensions/hash'

RSpec.describe Hash do
  describe '#slice' do
    it 'returns only specified fields' do
      hash = {
        name: 'john',
        age: 20,
        country: 'BR'
      }
      expect(hash.slice(:name, :country)).to eq name: 'john', country: 'BR'
    end
  end
end
