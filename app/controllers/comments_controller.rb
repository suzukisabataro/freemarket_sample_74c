class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
#{comment.item.id}"
    if comment.save
    redirect_to item_path(comment.item.id)
    else
    render show
    flash.now[:alert] = "商品出品に失敗しました"
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
