class ApplicationRecord
  def self.sample(num=1)
    num = 1 if num < 1
    self.collection.aggregate(
      [
        {
          '$sample': {
            size: num
          }
        }
      ]
    )
  end
end
