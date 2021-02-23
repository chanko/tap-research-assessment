# Class that gets campaigns from TapResearch API, parses the body
# and returns it
class CampaignsRetriever
  CAMPAIGNS_URL = '/api/v1/campaigns'

  attr_reader :connection

  def initialize(connection)
    @connection = connection
  end

  def retrieve
    raw_response = connection.get(CAMPAIGNS_URL).body

    JSON.parse(raw_response)
  rescue => error
    Rails.logger.error("[ERROR] - #{error}")
    
    return JSON.parse('[{}]')
  end
end
