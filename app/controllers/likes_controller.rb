class LikesController < ApplicationController
  def create
    Like.create(
      user_id: current_user.id,
      coordinate_id: params[:coordinate_id]
      )
    @coordinate = Coordinate.find(params[:coordinate_id])
  end

  def destroy
    like = current_user.likes.find_by(coordinate_id: params[:coordinate_id])
    like.destroy
    @coordinate = Coordinate.find(params[:coordinate_id])
  end
end
