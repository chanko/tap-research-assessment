require 'rails_helper'

RSpec.describe "Campaigns", type: :request do
  let!(:campaign) { FactoryBot.create(:campaign) }

  describe 'GET #ordered_campaigns' do
    it 'requests list of all campaigns' do
      get '/ordered_campaigns'

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to include(campaign.name)
    end
  end
end
