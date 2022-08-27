
# rubocop:disable all
# frozen_string_literal: true

class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    belongs_to :user, class_name: "User"
    validates :title, presence: true, length: { maximum: 250 }
    validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    
  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
# rubocop:enable all