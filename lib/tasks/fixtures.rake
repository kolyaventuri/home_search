require 'fileutils'

namespace :fixtures do
  desc "Clean out VCR cassettes from fixtures directory"
  task clean: :environment do
    puts 'Cleaning out fixtures'
    FileUtils.rm_rf 'fixtures/vcr_cassettes'
    puts 'Done'
  end
end
