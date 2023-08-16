class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, presence: true
  validates :lastname, :firstname,:birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  
end
