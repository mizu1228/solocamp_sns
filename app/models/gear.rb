class Gear < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  

  belongs_to :gear_genre
  belongs_to :user
  belongs_to :tweet, optional: true
  has_one_attached :image
  has_one :gear_maker_relation
  has_one :maker, through: :gear_maker_relation
end
