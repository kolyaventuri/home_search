require './lib/scripts/home_grabber'

namespace :spark do
  desc "Fetches homes from the Spark API and loads them into the database"
  task :pull, [:num] => [:environment] do |task, args|
    num = args[:num]
    unless num.nil?
      puts "Fetching #{num} homes..."
    else
      puts "Fetching all homes..."
    end
    HomeGrabber.new.run(num)
  end
end
