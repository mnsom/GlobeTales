class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :title, :description, :location, :category, presence: true
  validates :title, uniqueness: true
  validates :description, length: { minimum: 10 }

  include PgSearch::Model
  pg_search_scope :global_search, against: [:title], using: { tsearch: { prefix: true } }
end
