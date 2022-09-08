class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user, class_name: 'User'
  validates :title, presence: true, length: { maximum: 250 }

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def last_five_comment
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
