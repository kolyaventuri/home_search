require './app/services/spark_service'

class HomeGrabber
  def initialize
    @num = nil
    @collected = 0
  end

  def run(num=nil)
    if num.nil?
      @num = nil
    else
      @num = num.to_i
    end
    print "\n"
    grab_homes
  end

  private

  def grab_homes(page=1)
    results = SparkService.search(page: page)
    pagination = results[:pagination]

    results[:results].each do |home|
      @collected += 1
      total = @num || pagination['TotalRows']
      percentage = ((@collected / total.to_f) * 100).round(2)
      print "\r#{@collected} of #{total} homes pulled (#{percentage} complete)"
      unless @num.nil?
        return if @collected >= @num
      end
    end

    if pagination["TotalPages"] > pagination["CurrentPage"]
      grab_homes(pagination["CurrentPage"] + 1)
    end
  end
end
