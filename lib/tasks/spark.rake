namespace :spark do
  desc "Fetches homes from the Spark API and loads them into the database"
  task :pull, [:num] => [:environment] do |task, args|
    num = args[:num]
    unless num.nil?
      puts "Fetching #{num} homes..."
    else
      puts "Fetch all homes..."
    end
    puts 'TODO: Load homes'
  end

end
