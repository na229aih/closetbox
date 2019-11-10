class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @outer_items = Item.where(user_id: params[:id], category: "アウター").order("id DESC")
    @tops_items = Item.where(user_id: params[:id], category: "トップス").order("id DESC")
    @pants_items = Item.where(user_id: params[:id], category: "パンツ").order("id DESC")
    @shoes_items = Item.where(user_id: params[:id], category: "靴").order("id DESC")
    @bag_items = Item.where(user_id: params[:id], category: "バッグ").order("id DESC")
    @accessory_items = Item.where(user_id: params[:id], category: "小物").order("id DESC")
  end

  def follow
    Relationship.create(
      user_id: current_user.id,
      follow_id: params[:follow_id]
    )
    @user = User.find(params[:follow_id])
  end

  def unfollow
    following = current_user.relationships.find_by(follow_id: params[:follow_id])
    following.destroy
    @user = User.find(params[:follow_id])
  end

end