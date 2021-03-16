class CampStyle < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'テント' },
    { id: 2, name: 'タープ' },
    { id: 3, name: 'ハンモック' },
    { id: 4, name: 'ブッシュクラフト' },
    { id: 5, name: '車中泊' },
    { id: 6, name: '野晒し' },
    { id: 7, name: 'その他' }
  ]

end