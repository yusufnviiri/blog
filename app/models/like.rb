# rubocop:disable all

# frozen_string_literal: true

class Like < ApplicationRecord
    belongs_to :post
    belongs_to :user
    
end
# rubocop:enable all