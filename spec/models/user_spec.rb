require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio', posts_counter: 0)
  end
  it 'is valid with valid attributes' do
    user = create(:user)
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end
  it 'posts_counter is 0 by default' do
    user = create(:user)
    expect(user.posts_counter).to eq(0)
  end
 
  it 'displays the three most recent posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    expect(user.posts.count).to eq(3)
  end
end
