class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :update]
 
  def index
  end
  
  def show
  end
  
  def new
  end

  def create
    Book.create(image: book_params[:image], title: book_params[:title], author: book_params[:author], furigana: book_params[:furigana], user_id: current_user.id)
    redirect_to controller: :users
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy if book.user_id == current_user.id
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params) if book.user_id == current_user.id
  end

  private
  def book_params
    params.permit(:image, :title, :author, :furigana, :user_id)
  end
end
