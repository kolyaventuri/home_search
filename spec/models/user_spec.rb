require 'rails_helper'

describe User, type: :moel do
  it 'should validate unique UID' do
    user = User.create({ 'uid' => 12 })

    expect(user).to be_valid

    user2 = User.create({ 'uid' => 12 })

    expect(user2).to_not be_valid
  end
end
