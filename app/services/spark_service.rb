class SparkService
  def self.featured
    homes = make_request("/listings")

    homes.map do |home|
      Home.from_json(home.deep_symbolize_keys)
    end
  end

  private

  def self.make_request(endpoint)
    SparkApi.configure do |config|
      config.endpoint   = 'https://sparkapi.com/v1'

      config.api_key    = ENV['SPARK_API_KEY']
      config.api_secret = ENV['SPARK_SECRET']
    end

    SparkApi.client.get endpoint
  end
end
