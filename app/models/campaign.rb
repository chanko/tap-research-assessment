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
#
class Campaign < ApplicationRecord
  has_many :campaign_quotas
  has_many :campaign_qualifications, through: :campaign_quotas
end
