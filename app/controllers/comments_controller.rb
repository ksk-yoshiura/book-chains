class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)

    if @comment.valid?
      @comment.save
      @comments = []
      @comments << @comment
      render :comment_lists
    else
      render template: "chain/show"
    end
  end

  def destroy
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(chain_id: params[:chain_id], user_id: params[:user_id])
  end
end