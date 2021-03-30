class GearsMaker

  include ActiveModel::Model
  attr_accessor :gear_genre_id, :gear_name, :explanation, :image, :user_id, :tweet_id, :maker_name

  with_options presence: true do
    validates :user_id
    validates :gear_name
  end
  validates :gear_genre_id, numericality: { other_than: 0, message: 'を選択してください' }

  def save
    gear = Gear.create(gear_genre_id: gear_genre_id, gear_name: gear_name, explanation: explanation, user_id: user_id, tweet_id: tweet_id, image: image)
    maker = Maker.where(maker_name: maker_name).first_or_initialize
    maker.save

    GearMakerRelation.create(gear_id: gear.id, maker_id: maker.id)
  end
end