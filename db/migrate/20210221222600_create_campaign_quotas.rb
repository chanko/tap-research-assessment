class CreateCampaignQuotas < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_quotas do |t|
      t.integer :api_id
      t.belongs_to :campaign, null: false, foreign_key: true
      t.integer :num_respondendts
      t.string :name

      t.timestamps
    end
    add_index :campaign_quotas, :api_id
  end
end
