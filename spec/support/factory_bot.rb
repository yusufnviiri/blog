FactoryBot.define do
  factory :user do
    name { 'Andrew Carnegie' }
    photo { 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcQGAbfbEUtOL7rgs4k83HR6ZwJxlZr9MR10tX2SfAVYaQ9g___5y_nGoEUogrZvNp6R' }
    bio { 'I  am an  Industrialist ' }
    posts_counter { 0 }
  end
  factory :post do
    user
    title { 'Post Number one' }
    text { 'This is my first post' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
  factory :comment do
    user
    post
    text { 'This is my first comment' }
  end
  factory :like do
    user
    post
  end
end
