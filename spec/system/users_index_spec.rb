require 'rails_helper'

RSpec.describe 'User/index page', type: :system do
  before do
    @user1 = User.create(name: 'Andrew',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         bio: 'Industrialist.')
    @user2 = User.create(name: 'Paul',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         bio: 'Industrialist.')
  end

  it 'shows the username of all other users' do
    visit '/'
    expect(page).to have_content(@user1.name)
  end

  it 'show the profile picture of each user' do
    visit '/'
    expect(page).to have_selector("img[src*='#{@user1.photo}']")
  end

  it 'shows number of posts, post counter' do
    Post.create(title: 'Hello', text: 'This is my first post', user: @user1)
    Post.create(title: 'Hello2', text: 'This is my second post', user: @user1)
    visit '/'
    expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
  end

  it 'directs you the users profile page' do
    @user3 = User.create(name: 'coser',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         bio: 'Industrialist.')
    visit '/'
    click_on @user3.name
    expect(page).to have_current_path("/users/#{@user3.id}")
  end
end
