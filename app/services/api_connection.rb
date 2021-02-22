class ApiConnection
  def self.connection
    self.new.connection  
  end

  def connection
    @connection ||= begin
      Faraday.new(url: config.base_url) do |faraday|
        faraday.headers['Authorization'] = config.authorization_token
        faraday.adapter(Faraday.default_adapter)
      end
    end
  end

  private

  def config
    @config ||= ApiConnectionConfig.new
  end
end
