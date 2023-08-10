class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true # 名前の存在と一意性を保証
  validates :password, presence: true, length: { minimum: 6 } # パスワードの存在と長さを保証
  has_many :recipes
  has_many :ingredients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          #  :authentication_keys [:name] # nameを利用してログイン

  # nameを利用してログイン
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
