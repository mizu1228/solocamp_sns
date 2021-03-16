class Season < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '通年' },
    { id: 2, name: '冬' },
    { id: 3, name: '春' },
    { id: 4, name: '夏' },
    { id: 5, name: '秋' },
    { id: 6, name: '暖かい時' },
    { id: 7, name: '寒い時' }
  ]

  include ActiveHash::Associations
   has_many :users

end