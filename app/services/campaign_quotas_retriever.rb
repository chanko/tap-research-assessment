class CampaignQuotasRetriever
  CAMPAIGNS_URL = '/api/v1/campaigns'

  attr_reader :campaign_id, :connection, :response

  def initialize(campaign_id:, connection:)
    @campaign_id = campaign_id
    @connection = connection
  end

  def retrieve
    raw_response = connection.get("#{CAMPAIGNS_URL}/#{campaign_id}").body
    
    @response = JSON.parse(raw_response)

    persist_campaign_quotas

    return self
  end

  private

  def persist_campaign_qualifications(quota_id, qualifications)
    qualifications.each do |hash|
      CampaignQualification.create(
        campaign_quota_id: quota_id,
        question_id: hash['question_id'],
        pre_codes: hash.fetch('pre_codes', []).join(',')
      )
    end
  end

  def persist_campaign_quotas
    response.fetch('campaign_quotas', []).each do |hash|
      CampaignQuota.create(
        campaign_id: campaign_id,
        id: hash['id'],
        name: hash['name'],
        num_respondents: hash['num_respondents']
      )

      persist_campaign_qualifications(hash['id'], hash['campaign_qualifications'])
    end
  end
end
