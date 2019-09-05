class UsersController < ApplicationController

  def index
    @books = Book.where(user_id: current_user.id).order("created_at DESC").limit(10)
  end
  
  def show
    
  end

end
