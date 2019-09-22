class ChainsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [ :new, :create, :destroy]

  def index
    chains = Chain.all.order("created_at DESC")
    @chains = Chain.chain_arr_make(chains)

    num_chain_likes = Like.group(:chain_id).order('count(chain_id) desc').limit(3).pluck(:chain_id)
    chain_expert = Chain.where(id: num_chain_likes).pluck(:user_id)
    @user_ranks = User.where(id: chain_expert)
  end
  
  def show
    chain = [Chain.find(params[:id])]
    @chain = Chain.chain_arr_make(chain)
    

    @commented_chain = Chain.find(params[:id])
    @comment = Comment.new
    
    @comments = @commented_chain.comments
    
    session[:chain_id] = @commented_chain.id
  end

  def new
    @books = Book.where(user_id: current_user.id)
  end

  def create
    if params[:chain].present?
      if params[:chain].values[0].length == 4
        chain = Chain.new(book1_id: chain_params["book_ids"][0], book2_id: chain_params["book_ids"][1], book3_id: chain_params["book_ids"][2], book4_id: chain_params["book_ids"][3], user_id: chain_params["user_id"])
        flash[:success] = "チェーン作成に成功しました!!" if chain.save
        redirect_to controller: :users and return
      end
    end
    flash[:danger] = "チェーン作成に失敗しました。"
    redirect_to action: 'new' and return
  end
  
  def destroy
    chain = Chain.find(params[:id])
    if params[:user_id].to_i == current_user.id
      chain.destroy 
      flash[:success] = "消去に成功しました。"
      redirect_to controller: :users
    end
  end
  
  def search
    book_ids = Book.where('furigana LIKE(?)', "#{params[:keyword]}%").pluck(:id)
    chains = Chain.judge_and_search(book_ids)
    @chains = Chain.chain_arr_make(chains)
    render json: @chains
  end

  private
  def chain_params
    params.require(:chain).permit(:name, { :book_ids => [] }).merge(user_id: params.values[3])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end