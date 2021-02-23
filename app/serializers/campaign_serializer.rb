class CampaignSerializer < ActiveModel::Serializer
  cache key: 'campaign'
  attributes :id, :cpi, :name, :length_of_interview

  has_many :campaign_quotas
end
