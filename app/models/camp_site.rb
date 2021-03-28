class CampSite < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # include JpPrefecture

  with_options presence: true do
    validates :site
    validates :address
    validates :prefecture_id
    validates :site_type_id
  end

  has_many :visited_sites
  has_many :tweets

  belongs_to :site_type
  belongs_to :prefecture
end
