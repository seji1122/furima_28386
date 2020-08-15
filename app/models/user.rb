class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password
    NAME = /\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: NAME }
    validates :family_name, format: { with: NAME }
    KATAKANA = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
    validates :first_name_furigana, format: { with: KATAKANA }
    validates :family_name_furigana, format: { with: KATAKANA }
  end
  
end