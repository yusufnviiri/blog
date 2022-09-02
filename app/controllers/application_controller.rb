class ApplicationController < ActionController::Base
    @current_user = User.find_by(id: [:user_id])

end
