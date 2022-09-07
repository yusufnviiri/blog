# rubocop:disable all


require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio')
    @post = @user.posts.build(title: 'Lorem ipsum', text: 'some posts made')
  end
  it 'is valid with valid attributes' do
  end
  it 'is not valid without a title' do
    @post.title = nil
  end
  it 'displays the five most recent comments' do
  end
end
# rubocop:enable all