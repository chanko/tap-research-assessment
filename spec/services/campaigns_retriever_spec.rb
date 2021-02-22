require 'rails_helper'

RSpec.describe CampaignsRetriever, type: :model do
  let(:body) do 
    [
      FactoryBot.build(:campaigns_retriever_data).to_json,
      FactoryBot.build(:campaigns_retriever_data).to_json,
    ].to_json
  end
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:connection) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:retriever) { CampaignsRetriever.new(connection) }

  describe '#retrieve' do
    before(:each) do
      allow(connection).to receive(:get)
        .with('/api/v1/campaigns')
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
