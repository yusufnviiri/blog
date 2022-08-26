# rubocop:disable all
# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.string :photo
      t.string :bio
     t.timestamps
    end
  end
end
# rubocop:enable all
