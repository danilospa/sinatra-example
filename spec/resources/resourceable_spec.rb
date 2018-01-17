# frozen_string_literal: true

require './app/resources/resourceable'

RSpec.describe Resourceable do
  let(:klass) do
    Class.new do
      include Resourceable

      def attr_mapper
        [:id]
      end
    end
  end

  describe '#to_h' do
    subject { klass.new({ id: 2, other_field: 'value'}) }

    it 'maps correct fields' do
      expect(subject.to_h).to eq id: 2
    end
  end
end
