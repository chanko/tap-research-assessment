# Job that retrieves all campaigns, persists them and then queues
# another job to retrieve quotas and qualifications for each 
# created campaign
class CampaignsJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform
    json = CampaignsRetriever.new(ApiConnection.connection).retrieve
    json.each do |data|
      campaign = CampaignPersister.new(data).persist

      CampaignQuotasJob.perform_later(campaign.id) if campaign.persisted?
    end
  end
end
