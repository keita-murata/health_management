class User < ApplicationRecord
  has_many :trainings, dependent: :destroy
  has_many :events, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, unipueness: true
  validates :email, length: { maximum: 50 }
  validates :email, length: { minimum: 8 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
