class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true # 名前の存在と一意性を保証
  validates :password, presence: true, length: { minimum: 6 } # パスワードの存在と長さを保証
  has_many :recipes
  has_many :ingredients
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # usernameを利用してログイン
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if conditions.delete(:login)
      where(conditions).where(["username = :value", { value: username }]).first
    else
      where(conditions).first
    end
  end

  # emailを必要とする判定のためのメソッドをオーバーライド
  def email_required?
    false
  end

  # emailが変更されたかどうかの判定のためのメソッドをオーバーライド
  def email_changed?
    false
  end

  # emailが保存の際に変更されるかどうかの判定のためのメソッドをオーバーライド
  def will_save_change_to_email?
    false
  end
end
