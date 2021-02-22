require 'rails_helper'

# Test credentials are stored in encrypted file test.yml.enc
# email = 'codetest@tap.com'
# token = 'tokenfortestgoeshere'
# base_url = 'https://test.tapresearch.com'
RSpec.describe ApiConnectionConfig, type: :model do
  let(:config) { ApiConnectionConfig.new }

  it 'returns correct authorization token' do
    expect(config.authorization_token).to eq('Basic Y29kZXRlc3RAdGFwLmNvbTp0b2tlbmZvcnRlc3Rnb2VzaGVyZQ==')
  end

  it 'returns correct base_url' do
    expect(config.base_url).to eq('https://test.tapresearch.com')
  end
end
