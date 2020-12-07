class Item < ApplicationRecord
  belongs_to :user
  #has_one    :buy_record
  has_one_attached :image

  validates :name,presence: true

  validates :data,presence: true

  validates :category_id,presence: true
  validates :category_id, numericality: { other_than: 1 } 

  validates :status_id,presence: true
  validates :status_id, numericality: { other_than: 1 } 

  validates :delivery_fee_id,presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 } 

  validates :area_id,presence: true
  validates :area_id, numericality: { other_than: 1 } 

  validates :days_id,presence: true
  validates :days_id, numericality: { other_than: 1 } 

  validates :image,presence: true

  validates :price,presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }

  

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day


end
