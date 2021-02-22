require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'Associations' do
    it { should have_many(:campaign_quotas).class_name('CampaignQuota') }
  end
end
