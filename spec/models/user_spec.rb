require 'rails_helper'

describe User, type: :moel do
  it 'should validate unique UID' do
    user = User.create({ 'uid' => 12 })

    expect(user).to be_valid

    user2 = User.create({ 'uid' => 12 })

    expect(user2).to_not be_valid
  end

  it 'should be able to create a user from an OmniAuth hash' do
    user = User.from_omniauth(mock_auth_hash.to_hash)

    expect(user).to be_valid
  end
end
