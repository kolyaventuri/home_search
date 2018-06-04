class SparkService
  def self.featured
    opts = {
      _filters: 'PostalCode Eq "87114"',
      _expand: 'PrimaryPhoto'
    }
    homes = make_request('/listings', opts)

    homes.map do |home|
      Home.from_json(home.deep_symbolize_keys).serialize
    end
  end

  def self.search(params={})
    filter = build_filter(params)
    opts = {
      _filter: filter,
      _limit: 25,
      _pagination: 1,
      _expand: 'PrimaryPhoto',
      _page: params[:page] || 1
    }

    results = make_request('/listings', opts)
    homes = results.map do |home|
      Home.from_json(home.deep_symbolize_keys).serialize
    end

    {
      results: homes,
      pagination: results.pagination
    }
  end

  def self.build_filter(params)
    filters = ["PropertyType Eq 'A' Or PropertyType Eq 'C'"]
    params.each do |key, value|
      type = filter_types[key]
      value = "'#{value}'" if key == 'zip'
      filters.push("#{type} #{value}") unless type.nil?
    end

    filters.join(' And ')
  end

  private

  def self.filter_types
    {
      'zip' => 'PostalCode Eq',
      'minPrice' => 'ListPrice Ge',
      'maxPrice' => 'ListPrice Le',
      'minBeds' => 'BedsTotal Ge',
      'maxBeds' => 'BedsTotal Le',
      'minBaths' => 'BathsTotal Ge',
      'maxBaths' => 'BathsTotal Le',
      'minSqft' => 'BuildingAreaTotal Ge',
      'maxSqft' => 'BuildingAreaTotal Le'
    }
  end

  def self.make_request(endpoint, opts=nil)
    SparkApi.configure do |config|
      config.endpoint   = 'https://sparkapi.com/v1'

      config.api_key    = ENV['SPARK_API_KEY']
      config.api_secret = ENV['SPARK_SECRET']
    end

    SparkApi.client.get endpoint, opts
  end
end
