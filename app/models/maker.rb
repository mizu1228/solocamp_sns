class Maker < ApplicationRecord

  validates :maker_name, uniqueness: true

  has_many :gear_maker_relations
  has_many :gears, through: :gear_maker_relation
end
