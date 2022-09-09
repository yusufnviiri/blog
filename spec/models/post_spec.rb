require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio', posts_counter: 0)
    @post = @user.posts.build(title: 'Lorem ipsum', text: 'some posts made', comments_counter: 0, likes_counter: 0)
  end
  
  it 'is not valid without a title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end
  it 'comments_counter is not valid without a numericality' do
    @post.comments_counter = 'a'
    expect(@post).to_not be_valid
  end
  it 'comments_counter is not valid without a greater_than_or_equal_to' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end
  it 'comments_counter is not valid without a only_integer' do
    @post.comments_counter = 1.1
    expect(@post).to_not be_valid
  end
  it 'likes_counter is not valid without a numericality' do
    @post.likes_counter = 'a'
    expect(@post).to_not be_valid
  end
  it 'likes_counter is not valid without a greater_than_or_equal_to' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
  it 'likes_counter is not valid without a only_integer' do
    @post.likes_counter = 1.1
    expect(@post).to_not be_valid
  end
 
  it 'updates the posts_counter' do
    expect(@user.posts_counter).to eq(0)
  end
end
