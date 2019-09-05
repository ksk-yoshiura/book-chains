class ChainsController < ApplicationController
  skip_before_action :verify_authenticity_token
 
  def index
    chains = Chain.all.order("created_at DESC")
    chain_arr = []
    
    chains.each do |chain|
      new_chain = Chain.including_books(chain)
      chain_arr << new_chain
    end

    @chains = chain_arr
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

  

  private
  def chain_params
    params.require(:chain).permit(:name, { :book_ids => [] }).merge(user_id: params.values[3])
  end
end
