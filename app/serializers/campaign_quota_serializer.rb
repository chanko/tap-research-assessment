class CampaignQuotaSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_respondents, :campaign_qualifications

  has_many :campaign_qualifications, serializer: CampaignQualificationSerializer

  def campaign_qualifications
    object.campaign_qualifications.map do |qualification|
      CampaignQualificationSerializer.new(qualification)
    end
  end
end
