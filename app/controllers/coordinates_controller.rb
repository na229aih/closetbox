class CoordinatesController < ApplicationController

  def index
    @coordinate = Coordinate.all
  end

  def new
    @coordinate = Coordinate.new
    @outer_items = Item.where(user_id: current_user.id, category: "アウター")
    @tops_items = Item.where(user_id: current_user.id, category: "トップス")
    @pants_items = Item.where(user_id: current_user.id, category: "パンツ")
    @shoes_items = Item.where(user_id: current_user.id, category: "靴")
    @bag_items = Item.where(user_id: current_user.id, category: "バッグ")
    @accessory_items = Item.where(user_id: current_user.id, category: "小物")
  end

  def create
    Coordinate.create(
      description: coordinate_params[:description],
      item_ids: [
        session[:outer_item_id],
        session[:tops_item_id],
        session[:pants_item_id],
        session[:shoes_item_id],
        session[:bag_item_id],
        session[:accessory_item_id]
      ],
      user_id: current_user.id
    )
    session[:outer_item_id] = nil
    session[:tops_item_id] = nil
    session[:pants_item_id] = nil
    session[:shoes_item_id] = nil
    session[:bag_item_id] = nil
    session[:accessory_item_id] = nil
    redirect_to "/users/#{current_user.id}"
  end

  def select_outer
    session[:outer_item_id] = nil
    session[:outer_item_id] = params[:outer_item_id].to_i
  end

  def select_tops
    session[:tops_item_id] = nil
    session[:tops_item_id] = params[:tops_item_id].to_i
  end

  def select_pants
    session[:pants_item_id] = nil
    session[:pants_item_id] = params[:pants_item_id].to_i
  end

  def select_shoes
    session[:shoes_item_id] = nil
    session[:shoes_item_id] = params[:shoes_item_id].to_i
  end

  def select_bag
    session[:bag_item_id] = nil
    session[:bag_item_id] = params[:bag_item_id].to_i
  end

  def select_accessory
    session[:accessory_item_id] = nil
    session[:accessory_item_id] = params[:accessory_item_id].to_i
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:description)
  end

end