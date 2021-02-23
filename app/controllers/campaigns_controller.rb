class CampaignsController < ApplicationController
  def ordered_campaigns
    @campaigns = Campaign.includes(:campaign_quotas, :campaign_qualifications).left_outer_joins(:campaign_qualifications).group('campaigns.id').select('campaigns.*, count(*) as qualifications_count').order('qualifications_count DESC')

    respond_to do |format|
      format.json { render json: @campaigns }
    end
  end
end
