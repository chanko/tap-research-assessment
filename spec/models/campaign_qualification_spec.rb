require 'rails_helper'

RSpec.describe CampaignQualification, type: :model do
  describe 'Associations' do
    it { should belong_to(:campaign_quota).class_name('CampaignQuota') }
  end
end
