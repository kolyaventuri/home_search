class YelpService
  BASE_URL = 'https://api.yelp.com/'

  def make_request(endpoint, params={})
    request = build_request
    response = request.get nil, params do |req|
      req.url endpoint
      req.headers = build_headers
    end

    return { success: false } if response.status != 200

    parse_response(response.body)
  end

  private

  def build_request
    Faraday.new(url: BASE_URL)
  end

  def build_headers
    {
      'Authorization': "Bearer #{ENV['YELP_API_KEY']}"
    }
  end

  def parse_response(body)
    data = JSON.parse(body, symbolize_names: true)
    data[:success] = true

    data
  end
end
