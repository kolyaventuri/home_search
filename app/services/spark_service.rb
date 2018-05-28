class SparkService
  def self.featured
    homes = make_request('/listings', _filters: 'PostalCode Eq "87114"')

    homes.map do |home|
      Home.from_json(home.deep_symbolize_keys)
    end
  end

  def self.search(params)
    filter = build_filter(params)
    opts = {
      _filter: filter,
      _pagination: 1,
      _page: params[:page] || 1
    }

    results = make_request('/listings', opts)
    homes = results.map do |home|
      Home.from_json(home.deep_symbolize_keys)
    end

    {
      results: homes,
      pagination: results.pagination
    }
  end

  private

  def self.make_request(endpoint, opts=nil)
    SparkApi.configure do |config|
      config.endpoint   = 'https://sparkapi.com/v1'

      config.api_key    = ENV['SPARK_API_KEY']
      config.api_secret = ENV['SPARK_SECRET']
    end

    SparkApi.client.get endpoint, opts
  end

  def self.build_filter(params)
    filters = []
    params.each do |key, value|
      if key == 'zip'
        filters.push("PostalCode Eq '#{value}'")
      end
    end

    filters.join(' And ')
  end
end
