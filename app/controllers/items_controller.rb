class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
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
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :data, :category_id, :image, :status_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
