require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET /users/:user_id/posts/index' do
    let(:user) { User.create(name: 'test user') }

    before(:example) { get user_posts_path(user) }

    it 'displays a list of posts' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    let(:user) { User.create(name: 'test user') }
    let(:post) { user.posts.create(title: 'Test Post') }

    before(:example) { get user_post_path(user, post) }

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a specific post for a given user')
    end
  end
end
