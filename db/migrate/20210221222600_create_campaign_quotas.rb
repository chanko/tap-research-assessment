class CreateCampaignQuotas < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_quotas do |t|
      t.belongs_to :campaign, null: false, foreign_key: true
      t.integer :num_respondents
      t.string :name

      t.timestamps
    end
  end
end
