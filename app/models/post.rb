class Post < ApplicationRecord
  belongs_to :user
  belongs_to :bookmark, optional: true
  has_many_attached :photos, dependent: :destroy

  validates :title, :description, :location, :category, presence: true
  validates :title, uniqueness: true, length: { maximum: 30 }
  validates :description, length: { minimum: 10 }

  include PgSearch::Model
  pg_search_scope :global_search, against: [:title], using: { tsearch: { prefix: true } }

  CATEGORIES = ["学校", "仕事", "生活", "手続き", "言語", "住居", "食", "気候", "その他"]
end
