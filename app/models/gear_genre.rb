class GearGenre < ActiveHash::Base
  self.data = [
    { id: 0,  name: '--' },
    { id: 1,  name: 'テント' },
    { id: 2,  name: 'タープ' },
    { id: 3,  name: 'ハンモック' },
    { id: 4,  name: 'ベッド' },
    { id: 5,  name: 'マット' },
    { id: 6,  name: 'イス' },
    { id: 7,  name: 'テーブル' },
    { id: 8,  name: 'バーナー類' },
    { id: 9,  name: '焚き火台' },
    { id: 10, name: '薪ストーブ' },
    { id: 11, name: '焚き火小物' },
    { id: 12, name: 'ランタン' },
    { id: 13, name: '調理器具' },
    { id: 14, name: '調味料' },
    { id: 15, name: 'ナイフ' },
    { id: 16, name: '収納ボックス' },
    { id: 17, name: 'カバン' },
    { id: 18, name: '寝具' },
    { id: 19, name: 'アウターウェア' },
    { id: 20, name: 'インナーウェア' },
    { id: 21, name: 'パンツ' },
    { id: 22, name: 'シューズ' },
    { id: 23, name: '帽子' },
    { id: 24, name: 'その他' }
  ]

  include ActiveHash::Associations
   has_many :gears

end