class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
 
  def index
  end
  
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)

    chains = Chain.judge_and_search([params[:id].to_i])
    most_favorite_chain_id = Like.like_counter(chains)
    most_favorite_chain = Chain.where(id: most_favorite_chain_id)

    @most_favorite_chain = Chain.chain_arr_make(most_favorite_chain)
  end
  
  def new
  end

  def create
    book = Book.new(image: book_params[:image], title: book_params[:title], author: book_params[:author], furigana: book_params[:furigana], user_id: current_user.id)
    if book.save
      flash[:success] = "本の登録に成功しました!!"
    else 
      flash[:danger] = "本の登録に失敗しました。"
    end
    redirect_to controller: :users
  end

  def destroy
    book = Book.find(params[:id])
    if params[:user_id].to_i == current_user.id
      if book.destroy
        Chain.judge_and_destroy(book)
      end
      flash[:success] = "消去に成功しました。"
    end
    redirect_to controller: :users
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params) if book.user_id == current_user.id
    flash[:success] = "更新に成功しました。"
    redirect_to controller: :users
  end

  private
  def book_params
    params.permit(:image, :title, :author, :furigana, :user_id)
  end
end
