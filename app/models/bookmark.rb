class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :posts, through: :favorites

  validates :name, presence: true, uniqueness: true
end
