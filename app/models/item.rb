class Item < ApplicationRecord
  belongs_to :user
  #has_one    :buy_record
  has_one_attached :image

  validates :name,presence: true
  validates :data,presence: true
  validates :category_id,presence: true
  validates :status_id,presence: true
  validates :delivery_fee_id,presence: true
  validates :area_id,presence: true
  validates :days_id,presence: true
  validates :image,presence: true

end
