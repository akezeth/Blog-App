class Post < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Callback
  after_save :update_posts_counter

  # Validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # Methods
  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
