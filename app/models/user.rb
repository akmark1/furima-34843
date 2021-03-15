class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  validates :first_name, format: { with: /\A[一-龥]+\z/ }, presence: true
  validates :last_name, format: { with: /\A[一-龥]+\z/ }, presence: true
  validates :first_name_read, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
  validates :last_name_read, format: { with: /\A[ァ-ヶー－]+\z/ }, presence: true
end
