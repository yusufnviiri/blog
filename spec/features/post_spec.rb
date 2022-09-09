require 'spec_helper'
RSpec.describe 'Post integrations', type: :feature do
  it 'displays all posts' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    expect(page).to have_content('Number of posts', count: 0)
  end

  it 'displays user profile' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end
  it 'displays all comments' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)
    create(:comment, post:)
    visit user_posts_path(user)
    expect(page).to have_content('This is my first comment', count: 2)
  end
  it 'redirects to add new comment page when user clicks on "New comments:" link' do
    user = create(:user)
    post = create(:post, user:)
    visit user_post_path(user, post)
    click_link 'Add comment'
    expect(current_path).to eq(new_user_post_comment_path(user, post))
  end
  it 'redirects to add new like page when user clicks on "Likes:" ' do
    user = create(:user)
    post = create(:post, user:)
    visit user_post_path(user, post)
    click_link 'Add Like'
    expect(current_path).to eq(new_user_post_like_path(user, post))
  end
end
