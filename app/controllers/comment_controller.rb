class CommentController < ApplicationController

  def create
    @comment = Comment.create(set_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else 
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototype/show"
    end 
  end

  


  private
  def set_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
