require 'spec_helper'
RSpec.describe 'User integrations', type: :feature do
  it 'Can see user name ' do
    user = create(:user)
    visit user_posts_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'displays user profile' do
    user = create(:user)
    visit user_posts_path(user)
    expect(page).to have_content('Photo')
  end

  it 'displays  posts title ' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    expect(page).to have_content('Post Number one')
  end
  it 'displays  posts body' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    expect(page).to have_content('This is my first post')
  end

  it 'displays all comments' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)
    create(:comment, post:)
    visit user_posts_path(user)
    expect(page).to have_content('This is my first comment', count: 2)
  end

  it 'displays total number of comments' do
    user = create(:user)
    post = create(:post, user:)
    create(:comment, post:)
    create(:comment, post:)
    create(:comment, post:)

    visit user_posts_path(user)
    expect(page).to have_content('This is my first comment', count: 3)
  end

  it 'displays total number of likes' do
    user = create(:user)
    post = create(:post, user:)
    create(:like, post:)
    create(:like, post:)
    visit user_posts_path(user)
    expect(page).to have_content('Likes number')
  end
  it 'redirects to post show page ' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    click_link 'View Post'
    expect(current_path).to eq(new_user_posts_path(user))
  end
  it 'redirects view all posts' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    click_button 'Pagination'
    expect(current_path).to eq(new_user_posts_path(user))
  end
end
