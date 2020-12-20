class UserBuyRecord

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number,:token
  validates :token, presence: true


  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :phone_number, format: { with: /\A[0-9]+\z/}
  validates :phone_number, length: { maximum: 11}

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :address
    validates :phone_number
    validates :buy_record
  end

  def save
    buy_record=BuyRecord.create(user_id: user_id, item_id: item_id)
    Place.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end