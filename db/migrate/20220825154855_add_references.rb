# rubocop:disable all
# frozen_string_literal: true

class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :comments, foreign_key: true, index: true
    add_reference :posts, :comments, foreign_key: true, index: true
    add_reference :likes, :posts, foreign_key: true, index: true
    add_reference :users, :likes, foreign_key: true, index: true
    add_reference :users, :posts, foreign_key: true, index: true
  end
end
# rubocop:enable all