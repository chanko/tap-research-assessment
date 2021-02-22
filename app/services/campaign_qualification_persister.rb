class CampaignQualificationPersister
  attr_reader :campaign_quota_id, :question_id, :pre_codes

  def initialize(campaign_quota_id:, json:)
    @campaign_quota_id = campaign_quota_id
    @question_id = json['question_id']
    @pre_codes = json.fetch('pre_codes', []).join(',')
  end

  def persist
    CampaignQualification.create(
      campaign_quota_id: campaign_quota_id,
      question_id: question_id,
      pre_codes: pre_codes
    )
  end
end
