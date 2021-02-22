class CampaignQuotaPersister
  attr_reader :campaign_id, :id, :name, :num_respondents

  def initialize(campaign_id:, json:)
    @campaign_id = campaign_id
    @id = json['id']
    @name = json['name']
    @num_respondents = json['num_respondents']
  end

  def persist
    CampaignQuota.create(
      campaign_id: campaign_id,
      id: id,
      name: name,
      num_respondents: num_respondents
    )
  end
end
