require 'rails_helper'

RSpec.describe CampaignsRetriever, type: :model do
  let(:body) { "[{\"id\":278562,\"cpi\":\"2.0\",\"length_of_interview\":10,\"name\":\"Cereal\",\"total_remaining\":100,\"status\":6,\"supplier_link\":\"http://www.developingmedia.com/adhoc.php?id=\",\"incidence\":100,\"reentry_interval\":null,\"days_in_field\":5,\"max_daily_completes\":null,\"is_retarget\":false},{\"id\":278563,\"cpi\":\"1.25\",\"length_of_interview\":2,\"name\":\"Pizza\",\"total_remaining\":123,\"status\":6,\"supplier_link\":\"http://www.developingmedia.com/adhoc.php?id=\",\"incidence\":50,\"reentry_interval\":null,\"days_in_field\":5,\"max_daily_completes\":null,\"is_retarget\":false}]" }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:connection) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:retriever) { CampaignsRetriever.new(connection) }

  context '#retrieve' do
    before(:each) do
      allow(connection).to receive(:get)
        .with('/api/v1/campaigns')
        .and_return(
          double('response', status: 200, body: body
          )
      )
    end

    it 'creates 2 Campaign objects' do
      expect{retriever.retrieve}.to change{Campaign.count}.from(0).to(2)
      
      stubs.verify_stubbed_calls
    end
  end
end
