require 'spec_helper'

RSpec.describe 'Likes', type: :request do
  describe 'like related requests' do
    it 'creates a like' do
      user = create(:user)
      post = create(:post, user:)
      get "/users/#{user.id}/posts/#{post.id}/likes/new"
      expect(response).to render_template('new')
    end
  end
end
