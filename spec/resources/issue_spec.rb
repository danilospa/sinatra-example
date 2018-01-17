# frozen_string_literal: true

require './app/resources/issue'

RSpec.describe Resources::Issue do
  it 'includes resourceable' do
    expect(described_class).to include(Resourceable)
  end

  describe '#attr_mapper' do
    subject { described_class.new({}) }

    it 'maps correct fields' do
      fields = %i[id url repository_url labels_url comments_url events_url html_url number state title body locked
                  active_lock_reason comments closed_at created_at updated_at assignees]
      expect(subject.attr_mapper).to eq fields
    end
  end
end
