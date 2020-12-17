class BuyRecordsController < ApplicationController
  def index
    #binding.pry
    @item= Item.find(params[:item_id])
  end
end
