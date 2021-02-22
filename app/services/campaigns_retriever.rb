class CampaignsRetriever
  CAMPAIGNS_URL = '/api/v1/campaigns'

  attr_reader :connection, :response

  def initialize(connection)
    @connection = connection
  end

  def retrieve
    raw_response = connection.get(CAMPAIGNS_URL).body

    @response = JSON.parse(raw_response)

    persist_campaigns

    return self
  end

  private

  def persist_campaigns
    response.each do |hash|
      Campaign.create(
        id: hash['id'],
        cpi: hash['cpi'],
        length_of_interview: hash['length_of_interview'],
        name: hash['name']
      )
    end
  end
end
