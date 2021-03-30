class Gear < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  

  belongs_to :gear_genre
  belongs_to :user
  belongs_to :tweet, optional: true
  has_one_attached :image
  has_many :gear_maker_relations
  has_many :makers, through: :gear_maker_relation
end
