# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_825_154_855) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.integer 'AuthorId'
    t.integer 'PostId'
    t.text 'Text'
    t.datetime 'UpdatedAt'
    t.datetime 'CreatedAt'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'AuthorId'
    t.integer 'PostId'
    t.datetime 'CreatedAt'
    t.datetime 'UpdatedAt'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'posts_id'
    t.index ['posts_id'], name: 'index_likes_on_posts_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'AuthorId'
    t.text 'Title'
    t.text 'Text'
    t.datetime 'CreatedAt'
    t.datetime 'UpdatedAt'
    t.integer 'CommentsCounter'
    t.integer 'LikesCounter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'comments_id'
    t.index ['comments_id'], name: 'index_posts_on_comments_id'
  end

  create_table 'users', force: :cascade do |t|
    t.text 'Name'
    t.string 'Photo'
    t.string 'Bio'
    t.datetime 'UpdatedAt'
    t.datetime 'CreatedAt'
    t.integer 'PostsCounter'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'comments_id'
    t.bigint 'likes_id'
    t.bigint 'posts_id'
    t.index ['comments_id'], name: 'index_users_on_comments_id'
    t.index ['likes_id'], name: 'index_users_on_likes_id'
    t.index ['posts_id'], name: 'index_users_on_posts_id'
  end

  add_foreign_key 'likes', 'posts', column: 'posts_id'
  add_foreign_key 'posts', 'comments', column: 'comments_id'
  add_foreign_key 'users', 'comments', column: 'comments_id'
  add_foreign_key 'users', 'likes', column: 'likes_id'
  add_foreign_key 'users', 'posts', column: 'posts_id'
end
