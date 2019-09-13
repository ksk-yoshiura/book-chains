class UsersController < ApplicationController

  def index
    @books = Book.where(user_id: current_user.id).order("created_at DESC").limit(10)
    
    chains = Chain.where(user_id: current_user.id).order("created_at DESC")
    @chains = Chain.chain_arr_make(chains)

    num_chain_likes = Like.group(:chain_id).order('count(chain_id) desc').pluck(:chain_id)
    popular_chain = Chain.where(id: num_chain_likes, user_id: current_user.id).limit(3)
    @popular_chains = Chain.chain_arr_make(popular_chain)
  
    my_favorite_lists = Like.where(user_id: current_user.id).order("created_at DESC").pluck(:chain_id)
    my_favorite_chain = Chain.where(id: my_favorite_lists)
    @my_favorite_chains = Chain.chain_arr_make(my_favorite_chain)
  end
  
  def show
    @books = Book.where(user_id: params[:id]).order("created_at DESC").limit(10)
    
    chains = Chain.where(user_id: params[:id]).order("created_at DESC")
    @chains = Chain.chain_arr_make(chains)

    num_chain_likes = Like.group(:chain_id).order('count(chain_id) desc').pluck(:chain_id)
    popular_chain = Chain.where(id: num_chain_likes, user_id: params[:id]).limit(1)
    @popular_chains = Chain.chain_arr_make(popular_chain)
  
    favorite_lists = Like.where(user_id: params[:id]).order("created_at DESC").pluck(:chain_id)
    favorite_chain = Chain.where(id: favorite_lists)
    @favorite_chains = Chain.chain_arr_make(favorite_chain)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy if book.user_id == current_user.id
    
    chain = Chain.find(params[:id])
    chain.destroy if chain.user_id == current_user.id
  end
end