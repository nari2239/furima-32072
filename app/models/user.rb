class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    japanese_characters = /\A[ぁ-んァ-ン一-龥]/
    validates :last_name, format: { with: japanese_characters, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: japanese_characters, message: 'is invalid. Input full-width characters.' }
    japanese_katakana = /\A[ァ-ヶー－]+\z/
    validates :last_name_reading, format: { with: japanese_katakana, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_reading, format: { with: japanese_katakana, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
end
