class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable
        #  :validatable,

  soft_deletable  # <- kakurenbo-putiを使えるようにする

  # Emailに対する検証を削除する
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.raw_filter.respond_to? :attributes
      callback.raw_filter.attributes.delete :email
    end
  end

  # 論理削除に対応するためのvalidation
  validates :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
  validates_uniqueness_of :email, scope: :soft_destroyed_at, if: :email_changed?

  # DB認証時に使われるメソッドを上書きして、with_out_destroyedを追加する
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_destroyed.where(conditions.to_h).first
  end

  def follow(other_user)
    if self != other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  with_options presence: true do
    validates :name
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "は半角数字10~11桁、ハイフンなしで入力してください"}
  end

  with_options presence: true, on: :create do
    validates :password, confirmation: true, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数混在で入力してください'}
    validates :password_confirmation
  end

  validates :introduce, length: { maximum: 200 }

  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :interes
  has_many :visited_sites
  has_one_attached :image

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  belongs_to :camp_style
  belongs_to :trans_style
  belongs_to :season
  belongs_to :prefecture

  def liked_by?(tweet_id)
    likes.where(tweet_id: tweet_id).exists?
  end

  def visited_by?(camp_site_id)
    visited_sites.where(camp_site_id: camp_site_id).exists?
  end

  def intere_by?(camp_site_id)
    interes.where(camp_site_id: camp_site_id).exists?
  end

end
