class CampSite < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :site
    validates :address
    validates :prefecture_id
    validates :site_type_id
  end

  belongs_to :site_type
  belongs_to :prefecture
end
