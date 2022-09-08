require 'rails_helper'

RSpec.describe 'Users/show page', type: :system do
  before do
    @user1 = User.create(name: 'Andrew',
                         photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Andrew_Carnegie%2C_by_Theodore_Marceau.jpg/800px-Andrew_Carnegie%2C_by_Theodore_Marceau.jpg',
                         bio: 'Industrialist.')
  end
end
