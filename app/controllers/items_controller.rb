class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    Item.create(
      image: item_params[:image],
      name: item_params[:name],
      category: item_params[:category],
      size: item_params[:size],
      brand: item_params[:brand],
      user_id: current_user.id
    )
    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/users/#{current_user.id}"
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :category, :size, :brand)
  end

end
