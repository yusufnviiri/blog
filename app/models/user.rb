class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  validates :name, presence: true

  def three_most_recent_posts
    posts.includes(:user).order(created_at: :desc).limit(3)
  end
end
