class LikesController < ApplicationController
  
  before_action :set_chain

  def create
    @like = Like.create(user_id: current_user.id, chain_id: params[:chain_id])
    @likes = Like.where(chain_id: params[:chain_id])
    @chain.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, chain_id: params[:chain_id])
    like.destroy
    @likes = Like.where(chain_id: params[:chain_id])
    @chain.reload
  end

  private

  def set_chain
    @chain = Chain.find(params[:chain_id])
  end
end
