class ApplicationRecord
  def self.sample(num=1)
    num = 1 if num < 1
    items = self.collection.aggregate(
      [
        {
          '$sample': {
            size: num
          }
        }
      ]
    ).map do |item|
      item["_id"]
    end

    self.find(items)
  end
end
