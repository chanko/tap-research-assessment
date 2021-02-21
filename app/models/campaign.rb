# == Schema Information
#
# Table name: campaigns
#
#  id                  :bigint           not null, primary key
#  cpi                 :string
#  length_of_interview :integer
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  api_id              :integer
#
# Indexes
#
#  index_campaigns_on_api_id  (api_id)
#
class Campaign < ApplicationRecord
  has_many :campaign_quotas
end
