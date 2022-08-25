
# rubocop:disable all
# frozen_string_literal: true

json.array! @posts, partial: 'posts/post', as: :post
# rubocop:enable all