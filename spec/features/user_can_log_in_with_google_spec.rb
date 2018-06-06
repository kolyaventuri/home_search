require 'rails_helper'

describe 'A user visiting the homepage' do
  scenario 'can sign in with Google' do
    visit root_path

    expect(page).to have_content('Sign in with Google')
    mock_auth_hash

    click_link 'Sign in with Google'

    expect(page).to have_content(mock_user_hash['info']['name'])
  end

  scenario 'can log out' do
    visit root_path
    mock_auth_hash
    click_link 'Sign in with Google'

    click_link 'Logout'

    expect(page).to_not have_content(mock_user_hash['info']['name'])
  end
end
