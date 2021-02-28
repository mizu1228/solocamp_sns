class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable
        #  :validatable,

  soft_deletable  # <- kakurenbo-putiを使えるようにする

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

  with_options presence: true do
    validates :name
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: "is valid(without - )"}
  end
  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'is valid'}
  validates :introduce, length: { maximum: 400 }

  has_one_attached :image
end
