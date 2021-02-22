require 'rails_helper'

RSpec.describe CampaignQuota, type: :model do
  describe 'Associations' do
    it { should belong_to(:campaign).class_name('Campaign') }
    it { should have_many(:campaign_qualifications).class_name('CampaignQualification') }
  end
end
