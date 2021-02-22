require 'rails_helper'

RSpec.describe CampaignQuotasRetriever, type: :model do

  let(:body) { "{\"id\":278562,\"cpi\":\"2.0\",\"length_of_interview\":10,\"name\":\"Cereal\",\"total_remaining\":100,\"status\":6,\"supplier_link\":\"http://www.developingmedia.com/adhoc.php?id=\",\"incidence\":100,\"reentry_interval\":null,\"days_in_field\":5,\"max_daily_completes\":null,\"is_retarget\":false,\"is_maid_targeted\":false,\"retarget_count\":0,\"supported_devices\":[0,1,2],\"country_language_id\":1,\"custom_campaign_qualifications\":[{\"id\":360876282,\"question_id\":42,\"pre_codes\":[13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99]},{\"id\":360876283,\"question_id\":50005,\"pre_codes\":[0,1,2]}],\"campaign_quotas\":[{\"id\":1118454,\"num_respondents\":100,\"name\":\"\",\"campaign_qualifications\":[{\"question_id\":42,\"pre_codes\":[13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99]}]}],\"campaign_relationships\":[]}" }
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:stubs) { Faraday::Adapter::Test::Stubs.new }
  let(:connection) { Faraday.new { |b| b.adapter(:test, stubs) } }
  let(:retriever) { CampaignQuotasRetriever.new(campaign_id: campaign.id, connection: connection) }

  context '#retrieve' do
    before(:each) do
      allow(connection).to receive(:get)
        .with("/api/v1/campaigns/#{campaign.id}")
        .and_return(
          double('response', status: 200, body: body
          )
      )
    end

    it 'creates 1 CampaignQuota object' do
      expect{retriever.retrieve}.to change{CampaignQuota.count}.from(0).to(1)
    end

    it 'creates 1 CampaignQualification object' do
      expect{retriever.retrieve}.to change{CampaignQualification.count}.from(0).to(1)
    end
  end
end
