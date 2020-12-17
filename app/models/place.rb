class Place < ApplicationRecord
  belongs_to :buy_record
  belongs_to :area

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
