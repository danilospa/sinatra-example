# frozen_string_literal: true

require './app/clients/github'

RSpec.describe Clients::Github do
  it 'sets correct base url' do
    expect(described_class::BASE_URL).to eq ENV['GITHUB_URL']
  end

  it 'sets correct default options for request' do
    expect(described_class::DEFAULT_OPTIONS).to eq(
      format: :plain,
      headers: {
        Authorization: "token #{ENV['GITHUB_AUTH_TOKEN']}",
        'user-agent': 'poc-ruby'
      }
    )
  end
end
