class CampSite < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :site
    validates :address
    validates :prefecture_id
    validates :site_type_id
  end
  validates :site_tel, format: { with: /\A\d{10,11}\z/, message: "は半角数字10~11桁、ハイフンなしで入力してください"}

  belongs_to :site_type
  belongs_to :prefecture
end
