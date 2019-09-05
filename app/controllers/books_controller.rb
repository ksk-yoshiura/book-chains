class BooksController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    
  end

  def new
   
  end

  def create
    Book.create(image: book_params[:image], title: book_params[:title], author: book_params[:author], user_id: current_user.id)
    redirect_to controller: :users
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy if book.user_id == current_user.id
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params) if book.user_id == current_user.id
  end

  def show
    
  end

  private
  def book_params
    params.permit(:image, :title, :author, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
