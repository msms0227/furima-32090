class UserBuyRecord

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number


  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :address
    validates :phone_number
    validates :buy_record
  end
end