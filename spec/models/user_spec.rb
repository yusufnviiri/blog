# rubocop:disable all

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio')
  end
  it 'is valid with valid attributes' do
  end
  it 'is not valid without a name' do
    @user.name = nil
  end

  it 'displays the three most recent posts' do
    expect(@user.three_most_recent_posts).to eq([])
  end
end
# rubocop:enable all