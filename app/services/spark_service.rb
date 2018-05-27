class SparkService


  private

  def make_request(endpoint)
    SparkApi.configure do |config|
      config.endpoint   = 'https://sparkapi.com'

      config.api_key    = ENV['SPARK_API_KEY']
      config.api_secret = ENV['SPARK_SECRET']
    end

    SparkApi.client.get endpoint
  end
end
