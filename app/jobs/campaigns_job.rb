class CampaignsJob < ApplicationJob
  queue_as :default

  def perform
    json = CampaignsRetriever.new(ApiConnection.connection).retrieve
    json.each do |data|
      campaign = CampaignPersister.new(data).persist

      CampaignQuotasJob.perform_later(campaign.id)
    end
  end
end
