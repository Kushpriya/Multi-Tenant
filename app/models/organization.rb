class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :posts
  has_many :users
end
