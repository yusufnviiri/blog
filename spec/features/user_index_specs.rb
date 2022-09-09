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
  it 'displays total number of posts' do
    user = create(:user)
    create(:post, user:)
    create(:post, user:)
    visit users_path
    expect(page).to have_content(2)
  end
  it 'redirects to  user show page of the user ' do
    user = create(:user)
    create(:post, user:)
    visit users_path(user)
    click_link 'More details'
    expect(current_path).to eq(user_path(user))
  end
end
