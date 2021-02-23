class CampaignsController < ApplicationController
  def ordered_campaigns
    @campaigns = Campaign
      .left_outer_joins(:campaign_quotas)
      .includes(:campaign_quotas, :campaign_qualifications)
      .group('campaigns.id')
      .select('campaigns.*')
      .order('SUM(campaign_qualifications_count) DESC NULLS LAST')

    render json: @campaigns
  rescue => error
    Rails.logger.error("[ERROR] - #{error}")

    error_json = { 
      errors: [
        {
          status: 401,
          title: 'Error',
          detail: 'We were not able to process this request'
        }
      ] 
    }

    render json: error_json.to_json
  end
end
