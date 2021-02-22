require 'rails_helper'

RSpec.describe CampaignsRetriever, type: :model do
  let(:body) { "[{\"id\":278562,\"cpi\":\"2.0\",\"length_of_interview\":10,\"name\":\"Cereal\",\"total_remaining\":100,\"status\":6,\"supplier_link\":\"http://www.developingmedia.com/adhoc.php?id=\",\"incidence\":100,\"reentry_interval\":null,\"days_in_field\":5,\"max_daily_completes\":null,\"is_retarget\":false},{\"id\":278563,\"cpi\":\"1.25\",\"length_of_interview\":2,\"name\":\"Pizza\",\"total_remaining\":123,\"status\":6,\"supplier_link\":\"http://www.developingmedia.com/adhoc.php?id=\",\"incidence\":50,\"reentry_interval\":null,\"days_in_field\":5,\"max_daily_completes\":null,\"is_retarget\":false}]" }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:connection) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:retriever) { CampaignsRetriever.new(connection) }

  describe '#retrieve' do
    before(:each) do
      allow(connection).to receive(:get)
        .with('/api/v1/campaigns')
        .and_return(
          double('response', status: 200, body: body
          )
      )
    end

    it 'returns JSON parsed response' do
      expected_response = [
        {
          'cpi' => '2.0', 
          'days_in_field' => 5, 
          'id' => 278562, 
          'incidence' => 100, 
          'is_retarget' => false, 
          'length_of_interview' => 10,
          'max_daily_completes' => nil,
          'supplier_link' => 'http://www.developingmedia.com/adhoc.php?id=', 
          'total_remaining' => 123,
          'name' => 'Cereal',
          'reentry_interval' => nil,
          'status' => 6,
          'supplier_link' => 'http://www.developingmedia.com/adhoc.php?id=',
          'total_remaining' => 100
        },
        {
          'cpi' => '1.25',
          'days_in_field' => 5,
          'id' => 278563,
          'incidence' => 50,
          'is_retarget' => false,
          'length_of_interview' => 2,
          'max_daily_completes' => nil,
          'name' => 'Pizza',
          'reentry_interval' => nil,
          'status' => 6,
          'supplier_link' => 'http://www.developingmedia.com/adhoc.php?id=',
          'total_remaining' => 123
        }
      ]

      expect(retriever.retrieve).to eq(expected_response)
    end
  end
end
