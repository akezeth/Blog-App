require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should update the post comment counter' do
    first_user = User.create(name: 'Aklilu')
    post = Post.create(author: first_user, title: 'Hello World')
    comment = Comment.create(author: first_user, post:)

    comment.update_comments_counter

    expect(post.reload.comments_counter).to eq(1)
  end
end
