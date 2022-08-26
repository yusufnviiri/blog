# rubocop:disable all
# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
     
      t.timestamps
    end
  end
end
# rubocop:enable all
