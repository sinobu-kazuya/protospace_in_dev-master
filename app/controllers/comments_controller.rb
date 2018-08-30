class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], prototype_id: params[:prototype_id], user_id: current_user.id)
    redirect_to "/prototypes/#{@comment.prototype.id}"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
    comment.destroy
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :prototype_id)
  end
end
