require 'rails_helper'

RSpec.describe CampaignsJob, type: :job do
  before(:all) do
    ActiveJob::Base.queue_adapter = :test
  end

  describe '#perform' do
    before(:each) do
      body = [FactoryBot.build(:campaigns_retriever_data)]

      expect_any_instance_of(CampaignsRetriever).to receive(:retrieve).and_return(body)
    end

    it 'calls retrieve on CampaignsRetriever instance' do
      CampaignsJob.perform_now
    end

    it 'queues CampaignQuotasJob' do
      expect {
        CampaignsJob.perform_now
      }.to have_enqueued_job(CampaignQuotasJob)
    end
  end
end
