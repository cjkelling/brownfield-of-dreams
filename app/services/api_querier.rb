class ApiQuerier
  def self.query_api(url, path, access_token)
    response = connect(url, access_token).get(path)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.connect(url, access_token)
    Faraday.new(url: url) do |faraday|
      faraday.params['access_token'] = access_token
      faraday.adapter Faraday.default_adapter
    end
  end
end
