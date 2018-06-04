class SearchService
  def self.search(params)
    query = new.map_params(params)

    homes = Home.page(params[:page].to_i || 1).where(query)
    results = homes.map do |home|
      HomeSerializer.new(home).serializable_hash[:data][:attributes]
    end

    {
      results: results,
      pagination: {
        currentPage: homes.current_page,
        totalPages: homes.total_pages,
        count: homes.count
      }
    }
  end

  def self.featured
    Home.sample(12).map do |home|
      HomeSerializer.new(home).serializable_hash[:data][:attributes]
    end
  end

  def map_params(params)
    query_hash = {}
    prefix = 'StandardFields.'


    params.each_pair do |param, value|
      next if map[param].nil?

      name = map[param].first
      comparison = map[param][1]
      modifier = map[param][2]

      name = name.send(modifier) unless modifier.nil?
      value = /.*#{value}.*/i if comparison == '$regex'

      query_hash["#{prefix}#{name}"] = { comparison.to_sym => value }
    end

    query_hash
  end

  private

  def map
    {
      "zip" => ['PostalCode', "$eq", :to_s],
      "address" => ['UnparsedAddress', '$regex'],
      "minPrice" => ['ListPrice', "$gte"],
      "maxPrice" => ['ListPrice', "$lte"],
      "minBaths" => ['BathsTotal', "$gte"],
      "maxBaths" => ['BathsTotal', "$lte"],
      "minSqft" => ['BuildingAreaTotal', "$gte"],
      "maxSqft" => ['BuildingAreaTotal', "$lte"],
      "minBeds" => ['BedsTotal', "$gte"],
      "maxBeds" => ['BedsTotal', "$lte"]
    }
  end
end
