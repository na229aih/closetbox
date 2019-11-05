class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @outer_items = Item.where(user_id: params[:id], category: "アウター")
    @tops_items = Item.where(user_id: params[:id], category: "トップス")
    @pants_items = Item.where(user_id: params[:id], category: "パンツ")
    @shoes_items = Item.where(user_id: params[:id], category: "靴")
    @bag_items = Item.where(user_id: params[:id], category: "バッグ")
    @accessory_items = Item.where(user_id: params[:id], category: "小物")
  end

end