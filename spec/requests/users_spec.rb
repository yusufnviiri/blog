require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'User requests' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end
    it 'renders the show template' do
      user = create(:user)
      get "/users/#{user.id}"
      expect(response).to render_template('show')
    end
    it 'displays the three most recent posts' do
      user = create(:user)
      create(:post, user:)
      create(:post, user:)
      create(:post, user:)
      get "/users/#{user.id}"
      expect(assigns(:posts).count).to eq(3)
    end
  end
end
