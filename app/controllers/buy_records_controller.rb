class BuyRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:new, :create, :index]

  def index
    @buy_record = UserBuyRecord.new
  end

  def new
  end

  def create
    buy_record = UserBuyRecord.new(buy_record_params)
    if buy_record.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:user_buy_record).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif !@item.buy_record.nil?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_record_params[:token],
      currency: 'jpy'
    )
  end
end
