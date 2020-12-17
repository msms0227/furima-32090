class BuyRecordsController < ApplicationController
  def index
    @item= Item.find(params[:item_id])
    @buy_record=UserBuyRecord.new
  end

  def new
  end

  def create
    @item= Item.find(params[:item_id])
    buy_record=UserBuyRecord.new(buy_record_params)
    buy_record.save
    redirect_to root_path
  end

  private

  def buy_record_params
    params.permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id:@item.id)
  end
end
