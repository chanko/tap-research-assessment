class CampaignsController < ApplicationController
  def ordered_campaigns
    @campaigns = Campaign.includes(:campaign_quotas, :campaign_qualifications).left_outer_joins(:campaign_qualifications).group('campaigns.id').select('campaigns.*, count(*) as qualifications_count').order('qualifications_count DESC')

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
