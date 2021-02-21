require 'rails_helper'

RSpec.describe Campaign, type: :model do
  context 'Associations' do
    it { should have_many(:campaign_quotas).class_name('CampaignQuota') }
  end
end
