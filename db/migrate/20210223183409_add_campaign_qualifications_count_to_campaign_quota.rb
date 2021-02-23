class AddCampaignQualificationsCountToCampaignQuota < ActiveRecord::Migration[6.1]
  def change
    add_column :campaign_quotas, :campaign_qualifications_count, :integer
  end
end
