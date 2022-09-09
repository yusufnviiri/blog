require 'spec_helper'

RSpec.describe 'User integrations', type: :feature do
  it 'displays user profile in show page' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'Can see user name ' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end
  it 'displays total number of posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    visit user_path(user)
    expect(page).to have_content('Posts Number')
  end
  it 'displays user bio' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Bio')
  end

  it 'displays three most recent posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    create(:post, user:)
    visit user_path(user)
    expect(page).to have_content('My first post', count: 0)
  end

  it 'redirects to all user posts ' do
    user = create(:user)
    visit user_path(user)
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
  it 'redirects to  user show page of the user ' do
    user = create(:user)
    create(:post, user:)
    visit users_path(user)
    click_link 'More details'
    expect(current_path).to eq(user_path(user))
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
end
