# == Schema Information
#
# Table name: campaign_qualifications
#
#  id                :bigint           not null, primary key
#  pre_codes         :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  campaign_quota_id :bigint           not null
#  question_id       :integer
#
# Indexes
#
#  index_campaign_qualifications_on_campaign_quota_id  (campaign_quota_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_quota_id => campaign_quotas.id)
#
class CampaignQualification < ApplicationRecord
  belongs_to :campaign_quota, counter_cache: true
end
