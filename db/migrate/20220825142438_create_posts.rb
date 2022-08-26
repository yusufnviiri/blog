# rubocop:disable all
# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|    
      t.text :title
      t.text :text
      t.timestamps
    end
  end
end
# rubocop:enable all