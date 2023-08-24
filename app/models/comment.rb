class Comment < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Callback
  after_save :update_comments_counter

  # Methods
  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
