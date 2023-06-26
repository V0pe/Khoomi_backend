class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, uniqueness: { case_sensitive: false }, presence: true
  validates :last_name, uniqueness: { case_sensitive: false }
  validates :country, presence: true
  validates :date_of_birth, presence: true
end
