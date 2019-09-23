class LikesController < ApplicationController
  before_action :set_chain

  def create
    @like = Like.create(user_id: current_user.id, chain_id: params[:chain_id])
    @likes = Like.where(chain_id: params[:chain_id])
    arr = [@set_chain]
    chain_arr = Chain.chain_arr_make(arr)
    @chain = chain_arr[0]
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, chain_id: params[:chain_id])
    like.destroy
    @likes = Like.where(chain_id: params[:chain_id])
    arr = [@set_chain]
    chain_arr = Chain.chain_arr_make(arr)
    @chain = chain_arr[0]
  end

  private

  def set_chain
    @set_chain = Chain.find(params[:chain_id])
  end
end
