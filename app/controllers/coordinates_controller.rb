class CoordinatesController < ApplicationController

  def index
    @coordinates = Coordinate.all.order("id DESC").page(params[:page]).per(12)
  end

  def new
    @coordinate = Coordinate.new
    @outer_items = Item.where(user_id: current_user.id, category: "アウター").order("id DESC")
    @tops_items = Item.where(user_id: current_user.id, category: "トップス").order("id DESC")
    @pants_items = Item.where(user_id: current_user.id, category: "パンツ").order("id DESC")
    @shoes_items = Item.where(user_id: current_user.id, category: "靴").order("id DESC")
    @bag_items = Item.where(user_id: current_user.id, category: "バッグ").order("id DESC")
    @accessory_items = Item.where(user_id: current_user.id, category: "小物").order("id DESC")
  end

  def create
    if (session[:tops_item_id] && session[:pants_item_id]).present?
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
      redirect_to root_path
    else
      session[:outer_item_id] = nil
      session[:tops_item_id] = nil
      session[:pants_item_id] = nil
      session[:shoes_item_id] = nil
      session[:bag_item_id] = nil
      session[:accessory_item_id] = nil
      redirect_to "/coordinates/new"
    end
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

  def show
    @coordinate = Coordinate.find(params[:id])
    @comment = Comment.new
    @comments = @coordinate.comments
  end

  def edit
    @coordinate = Coordinate.find(params[:id])
    @outer_items = Item.where(user_id: current_user.id, category: "アウター").order("id DESC")
    @tops_items = Item.where(user_id: current_user.id, category: "トップス").order("id DESC")
    @pants_items = Item.where(user_id: current_user.id, category: "パンツ").order("id DESC")
    @shoes_items = Item.where(user_id: current_user.id, category: "靴").order("id DESC")
    @bag_items = Item.where(user_id: current_user.id, category: "バッグ").order("id DESC")
    @accessory_items = Item.where(user_id: current_user.id, category: "小物").order("id DESC")
  end

  def update
    coordinate = Coordinate.find(params[:id])
    coordinate.update(
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
    redirect_to "/coordinates/#{params[:id]}"
  end

  def destroy
    @coordinate = Coordinate.find(params[:id])
    @coordinate.destroy
    redirect_to root_path
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:description)
  end

end