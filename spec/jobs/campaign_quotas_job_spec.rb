require 'rails_helper'

RSpec.describe CampaignQuotasJob, type: :job do
  before(:all) do
    ActiveJob::Base.queue_adapter = :test
  end

  describe '#perform' do
    let!(:campaign) { FactoryBot.create(:campaign) }
    
    before(:each) do
      body = JSON.parse(FactoryBot.build(:campaign_quotas_retriever_data).to_json)

      expect_any_instance_of(CampaignQuotasRetriever).to receive(:retrieve).and_return(body)
    end

    it 'calls retrieve on CampaignQuotasRetriever instance' do
      CampaignQuotasJob.perform_now(campaign.id)
    end

    it 'calls persist on CampaignQuotaPersister instance' do
      expect_any_instance_of(CampaignQuotaPersister).to receive(:persist).and_call_original

      CampaignQuotasJob.perform_now(campaign.id)
    end
  end
end
