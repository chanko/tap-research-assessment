# Class that receives a parsed json object and checks if a 
# CampaignQualification object with the same Question ID and 
# Campaign Quota ID already exists. 
#
# If it does, it returns the already persisted object.
# 
# If it doesn't, then it creates it.
class CampaignQualificationPersister
  attr_reader :campaign_quota_id, :question_id, :pre_codes

  def initialize(campaign_quota_id:, json:)
    @campaign_quota_id = campaign_quota_id
    @question_id = json['question_id']
    @pre_codes = json.fetch('pre_codes', []).join(',')
  end

  def persist
    CampaignQualification.
      create_with(pre_codes: pre_codes).
      find_or_create_by(
        question_id: question_id, 
        campaign_quota_id: campaign_quota_id
      )
  end
end
