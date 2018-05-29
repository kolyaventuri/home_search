require 'rails_helper'

feature 'As a user searching for homes' do
  context 'I can enter a zip code' do
    let(:query) { 87114 }

    scenario 'and be sent to the page for those homes' do
      visit '/'

      within('.search') do
        fill_in 'q', with: query

        find('.searchBtn').click
      end

      expect(current_path).to eq("/search?q=#{query}")

      expect(page).to have_content("Homes in #{query}")
    end
  end
end
