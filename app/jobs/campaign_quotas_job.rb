class CampaignQuotasJob < ApplicationJob
  queue_as :default

  def perform(campaign_id)
    json = CampaignQuotasRetriever.new(
      campaign_id: campaign_id, 
      connection: ApiConnection.connection
    ).retrieve

    json.fetch('campaign_quotas', []).each do |quota_data|
      quota = CampaignQuotaPersister.new(
        campaign_id: campaign_id,
        json: quota_data
      ).persist

      qualifications_data = quota_data.fetch('campaign_qualifications', [])
      qualifications_data.each do |qualification_data|
        CampaignQualificationPersister.new(
          campaign_quota_id: quota.id,
          json: qualification_data
        ).persist
      end
    end
  end
end