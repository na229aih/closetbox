class CommentsController < ApplicationController
  def create
    Comment.create(text: params[:comment][:text], coordinate_id: params[:coordinate_id], user_id: current_user.id)
    redirect_to "/coordinates/#{params[:coordinate_id]}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/coordinates/#{params[:coordinate_id]}"
  end
end
