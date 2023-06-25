class User < ApplicationRecord
  validates :first_name, uniqueness: { case_sensitive: false }, presence: true
  validates :last_name, uniqueness: { case_sensitive: false }
  validates :country, presence: true
  validates :date_of_birth, presence: true
end
