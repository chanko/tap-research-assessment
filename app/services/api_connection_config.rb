# Class that holds basic configuration information to connect
# to TapReserach API with credentials stored in encrypted
# credentials file
class ApiConnectionConfig
  # According to docs, HTTP basic authentication combined with 
  # HTTPS is used
  #
  # Instructions on how to form token can be found at
  # http://docs.tapresearch.com/#authentication
  #
  # TODO 
  # Notify TapResearch team their docs have a typo
  # A space is missing between 'Basic' and the encoded token 
  def authorization_token
    @authorization_token ||= "Basic " + Base64::strict_encode64("#{email}:#{token}")
  end

  def base_url
    @base_url ||= Rails.application.credentials.dig(:tap_research_api, :url)
  end

  private

  def email
    @email ||= Rails.application.credentials.dig(:tap_research_api, :email)
  end

  def token
    @token ||= Rails.application.credentials.dig(:tap_research_api, :token)
  end
end
