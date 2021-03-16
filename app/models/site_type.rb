class SiteType < ActiveHash::Base
  self.data = [
    { id: 0, name: '林間' },
    { id: 1, name: '山間' },
    { id: 2, name: '湖畔' },
    { id: 3, name: '川辺' },
    { id: 4, name: '砂浜' },
    { id: 5, name: '臨海' },
    { id: 6, name: 'オート' },
    { id: 7, name: 'ロッジ、バンガロー' },
    { id: 8, name: '芝' }
  ]

  include ActiveHash::Associations
  has_many :camp_sites
end