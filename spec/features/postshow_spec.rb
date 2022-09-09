require 'spec_helper'
RSpec.describe 'Post integrations', type: :feature do
  it 'displays  posts title ' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    expect(page).to have_content('This is my first post')
  end

  it 'Can see post author ' do
    user = create(:user)
    visit user_posts_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'displays  posts body' do
    user = create(:user)
    create(:post, user:)
    post = create(:post, user:)
    visit user_posts_path(user, post)
    expect(page).to have_content('This is my first post')
  end

  it 'displays total number of comments' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)
    visit user_post_path(user, post)
    expect(page).to have_content('Comments')
  end

  it 'displays total number of likes' do
    user = create(:user)
    post = create(:post, user:)
    create(:like, post:)
    create(:like, post:)
    visit user_post_path(user, post)
    expect(page).to have_content('Likes')
  end

  it 'Can see user name of the commentor ' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'Can see the comment ' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)

    visit user_post_path(user, post)
    expect(page).to have_content('This is my first comment')
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
