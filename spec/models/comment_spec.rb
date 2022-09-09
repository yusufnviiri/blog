require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio', posts_counter: 0)
    @post = @user.posts.build(title: 'Lorem ipsum', text: 'some posts made', comments_counter: 0, likes_counter: 0)
    @comment = @post.comments.build(user_id: @user.id, text: 'some comments made')
  end
  it 'is not valid without a user_id' do
    @comment.user_id = nil
    expect(@comment).to_not be_valid
  end
  it 'is not valid without a post_id' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end
  it 'updates the comments_counter' do
    expect(@post.comments_counter).to eq(0)
  end
end
