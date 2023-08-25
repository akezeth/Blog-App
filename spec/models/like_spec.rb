require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should update the post like counter' do
    first_user = User.create(name: 'Aklilu')
    post = Post.create(author: first_user, title: 'Hello World')
    like = Like.create(author: first_user, post:)

    like.update_likes_counter

    expect(post.reload.likes_counter).to eq(1)
  end
end
