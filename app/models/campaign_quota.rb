# == Schema Information
#
# Table name: campaign_quotas
#
#  id                            :bigint           not null, primary key
#  campaign_qualifications_count :integer
#  name                          :string
#  num_respondents               :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  campaign_id                   :bigint           not null
#
# Indexes
#
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
