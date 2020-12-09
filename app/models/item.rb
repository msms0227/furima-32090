class Item < ApplicationRecord
  belongs_to :user
  # has_one    :buy_record
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :data
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_id
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_id
  end



  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }
  validates :price, numericality: { greater_than: 299, message: '300円以上で入力して下さい' }
  validates :price, numericality: { less_than: 10_000_000, message: '9999999以下で入力して下さい' }

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
end
