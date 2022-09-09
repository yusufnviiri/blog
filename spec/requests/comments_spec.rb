require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'comment related requests' do
    it 'creates a comment' do
      user = create(:user)
      post = create(:post, user:)
      get "/users/#{user.id}/posts/#{post.id}/comments/new"
      expect(response).to render_template('new')
    end
  end
end
