class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :bookmark

  validates_uniqueness_of :post_id, { scope: :bookmark_id }
end
