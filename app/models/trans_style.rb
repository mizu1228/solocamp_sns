class TransStyle < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '車' },
    { id: 2, name: 'バイク' },
    { id: 3, name: '自転車' },
    { id: 4, name: '徒歩、交通機関' },
    { id: 5, name: 'ヒッチハイク' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
   has_many :users

end