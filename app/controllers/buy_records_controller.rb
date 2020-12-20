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
    #binding.pry              
    if buy_record.save
      pay_item
      redirect_to root_path
    else 
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:user_buy_record).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  
        card: buy_record_params[:token],    
        currency: 'jpy'                 
      )
  end
end
