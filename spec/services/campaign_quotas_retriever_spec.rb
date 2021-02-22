require 'rails_helper'

RSpec.describe CampaignQuotasRetriever, type: :model do

  let(:body) { FactoryBot.build(:campaign_quotas_retriever_data).to_json }
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:connection) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:retriever) { CampaignQuotasRetriever.new(campaign_id: campaign.id, connection: connection) }

  describe '#retrieve' do
    before(:each) do
      allow(connection).to receive(:get)
        .with("/api/v1/campaigns/#{campaign.id}")
        .and_return(
          double('response', status: 200, body: body
          )
      )
    end

    it 'returns JSON parsed response' do
      expect(JSON).to receive(:parse).with(body)
      
      retriever.retrieve
    end
  end
end
