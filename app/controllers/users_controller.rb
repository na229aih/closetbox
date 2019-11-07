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

end