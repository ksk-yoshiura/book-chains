class UsersController < ApplicationController

  def index
    @books = Book.where(user_id: current_user.id).order("created_at DESC").limit(10)
    
    chains = Chain.where(user_id: current_user.id).order("created_at DESC")
    @chains = Chain.chain_arr_make(chains)
  end
  
  def show
    
  end
end