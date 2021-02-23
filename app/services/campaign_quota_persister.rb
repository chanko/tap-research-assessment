# Class that receives a parsed json object and checks if a 
# CampaignQuota object with the same ID already exists. 
#
# If it does, it returns the already persisted object.
# 
# If it doesn't, then it creates it.
class CampaignQuotaPersister
  attr_reader :campaign_id, :id, :name, :num_respondents

  def initialize(campaign_id:, json:)
    @campaign_id = campaign_id
    @id = json['id']
    @name = json['name']
    @num_respondents = json['num_respondents']
  end

  def persist
    CampaignQuota.create_with(
      campaign_id: campaign_id,
      name: name,
      num_respondents: num_respondents
    ).find_or_create_by(id: id)
  end
end
