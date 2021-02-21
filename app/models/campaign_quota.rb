# == Schema Information
#
# Table name: campaign_quotas
#
#  id               :bigint           not null, primary key
#  name             :string
#  num_respondendts :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  api_id           :integer
#  campaign_id      :bigint           not null
#
# Indexes
#
#  index_campaign_quotas_on_api_id       (api_id)
#  index_campaign_quotas_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#
class CampaignQuota < ApplicationRecord
  belongs_to :campaign

  has_many :campaign_qualifications
end
