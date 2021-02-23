# Class that gets a specific campaign from TapResearch API, parses the body
# and returns it
class CampaignQuotasRetriever
  CAMPAIGNS_URL = '/api/v1/campaigns'

  attr_reader :campaign_id, :connection, :response

  def initialize(campaign_id:, connection:)
    @campaign_id = campaign_id
    @connection = connection
  end

  def retrieve
    raw_response = connection.get("#{CAMPAIGNS_URL}/#{campaign_id}").body
    
    JSON.parse(raw_response)
  rescue => error
    Rails.logger.error("[ERROR] - #{error}")

    JSON.parse('{}')
  end
end
