class SparkService
  def self.featured
    opts = {
      _filters: 'PostalCode Eq "87114"',
      _expand: 'PrimaryPhoto'
    }
    homes = make_request('/listings', opts)

    homes.map do |home|
      Home.from_json(home.deep_symbolize_keys)
    end
  end

  def self.search(params)
    filter = build_filter(params)
    opts = {
      _filter: filter,
      _pagination: 1,
      _expand: 'PrimaryPhoto',
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

  def self.build_filter(params)
    filters = ["PropertyType Eq 'A' Or PropertyType Eq 'C'"]
    params.each do |key, value|
      case key
      when 'zip'
        filters.push("PostalCode Eq '#{value}'")
      when 'minPrice'
        filters.push("ListPrice Ge #{value}")
      when 'maxPrice'
        filters.push("ListPrice Le #{value}")
      when 'minBeds'
        filters.push("BedsTotal Ge #{value}")
      when 'maxBeds'
        filters.push("BedsTotal Le #{value}")
      when 'minBaths'
        filters.push("BathsTotal Ge #{value}")
      when 'maxBaths'
        filters.push("BathsTotal Le #{value}")
      when 'minSqft'
        filters.push("BuildingAreaTotal Ge #{value}")
      when 'maxSqft'
        filters.push("BuildingAreaTotal Le #{value}")
      end
    end

    filters.join(' And ')
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
end
