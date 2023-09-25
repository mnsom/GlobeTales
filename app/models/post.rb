class Post < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, depenent: :destory
  has_many_attached :photos, dependent: :destroy

  validates :title, :description, :location, :category, presence: true
end
