class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :show
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :data, :category_id, :image, :status_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
