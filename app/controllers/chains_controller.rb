class ChainsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:show, :new, :create, :destroy]

  def index
    chains = Chain.all.order("created_at DESC")
    @chains = Chain.chain_arr_make(chains)

    num_chain_likes = Like.group(:chain_id).order('count(chain_id) desc').limit(3).pluck(:chain_id)
    chain_expert = Chain.where(id: num_chain_likes).pluck(:user_id)
    @user_ranks = User.where(id: chain_expert)
  end
  
  def show
    
  end

  def new
    @books = Book.where(user_id: current_user.id)
  end  

  def create
    @chain = Chain.create(book1_id: chain_params["book_ids"][0], book2_id: chain_params["book_ids"][1], book3_id: chain_params["book_ids"][2], book4_id: chain_params["book_ids"][3], user_id: chain_params["user_id"])
    redirect_to action: 'new'
  end
  
  def destroy
    chain = Chain.find(params[:id])
    chain.destroy if chain.user_id == current_user.id
  end

  private
  def chain_params
    params.require(:chain).permit(:name, { :book_ids => [] }).merge(user_id: params.values[3])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end