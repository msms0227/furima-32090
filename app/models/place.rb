class Place < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buy_record
  belongs_to :area
end
