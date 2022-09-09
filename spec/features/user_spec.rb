require 'spec_helper'

RSpec.describe 'User integrations', type: :feature do
  it 'displays all users' do
    create(:user)
    visit users_path
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'displays user profile' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'redirects to create new post page when user clicks on "New Post" link' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    click_link 'New post'
    expect(current_path).to eq(new_user_post_path(user))
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
  it 'redirects to post page when user clicks on "View Post" link' do
    user = create(:user)
    create(:post, user:)
    visit users_path(user)
    click_link 'More details'
    expect(current_path).to eq(user_path(user))
  end
  it 'redirects to post page when user clicks on  post content link' do
    user = create(:user)
    visit user_path(user)
    click_link 'Show all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
