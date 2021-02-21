class CreateCampaignQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_qualifications do |t|
      t.belongs_to :campaign_quota, null: false, foreign_key: true
      t.integer :question_id
      t.text :pre_codes

      t.timestamps
    end
  end
end
