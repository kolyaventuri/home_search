require 'rails_helper'

describe 'A user visiting the homepage' do
  scenario 'can sign in with Google' do
    visit root_path

    expect(page).to have_content('Sign in with Google')
    mock_auth_hash

    click_link 'Sign in with Google'

    expect(page).to have_content('mockuser')
  end
end
