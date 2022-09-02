require 'rails_helper'

RSpec.describe 'Posts+', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      get '/users/:id/posts'
      expect(response).to render_template('index')
    end
    it 'renders the show template' do
      get '/users/:id/posts/:id'
      expect(response).to render_template('show')
    end
  end
end
