class ItemsController < ApplicationController

  def index
  end

  def new
    @item=Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end
end
private

  def item_params
    params.require(:item).permit(:name, :data, :category_id, :image, :status_id, :delivery_fee_id, :area_id, :days_id)
  end
