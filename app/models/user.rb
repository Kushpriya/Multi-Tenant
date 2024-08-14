class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization
  has_many :posts

  validates :organization_id, presence: true
end
