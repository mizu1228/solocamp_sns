class GearsMaker

  include ActiveModel::Model
  attr_accessor :gear_genre_id, :gear_name, :explanation, :image, :user_id, :tweet_id, :maker_name

  with_options presence: true do
    validates :user_id
    validates :gear_name
    validates :maker_name
  end
  validates :gear_genre_id, numericality: { other_than: 0, message: 'を選択してください' }

  delegate :persisted?, to: :gear

  def initialize(attributes = nil, gear: Gear.new)
    @gear = gear
    attributes ||= default_attributes
    super(attributes)
  end

  # def save
  #   gear = Gear.create(gear_genre_id: gear_genre_id, gear_name: gear_name, explanation: explanation, user_id: user_id, tweet_id: tweet_id, image: image)
  #   maker = Maker.where(maker_name: maker_name).first_or_initialize
  #   maker.save

  #   GearMakerRelation.create(gear_id: gear.id, maker_id: maker.id)
  # end

  def save(maker_list)
    ActiveRecord::Base.transaction do
      @gear.update(gear_genre_id: gear_genre_id, gear_name: gear_name, explanation: explanation, image: image, user_id: user_id, tweet_id: tweet_id)

      @gear.makers.each do |maker|
        maker.destroy
      end

      maker_list.each do |maker_list|
        maker = Maker.where(maker_name: maker_list).first_or_initialize
        maker.save

        gear_maker_relation = GearMakerRelation.where(gear_id: @gear.id, maker_id: maker.id).first_or_initialize
        gear_maker_relation.update(gear_id: @gear.id, maker_id: maker.id)
      end

    end
  end

  def to_model
    gear
  end

  private

  attr_reader :gear

  def default_attributes
    if gear.makers.any?
    {
      gear_genre_id: gear.gear_genre_id,
      gear_name: gear.gear_name,
      explanation: gear.explanation,
      image: gear.image,
      user_id: gear.user_id,
      tweet_id: gear.tweet_id,
      maker_name: gear.makers.pluck(:maker_name)
    }
    else
    {
      gear_genre_id: gear.gear_genre_id,
      gear_name: gear.gear_name,
      explanation: gear.explanation,
      image: gear.image,
      user_id: gear.user_id,
      tweet_id: gear.tweet_id
    }
    end
  end

end