require 'rails_helper'

RSpec.describe 'Posts+', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      user = create(:user)
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      user = create(:user)
      get "/users/#{user.id}/posts"
      expect(response).to render_template('index')
    end
    it 'renders the show template' do
      user = create(:user)
      post = create(:post, user:)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end
  end
end
