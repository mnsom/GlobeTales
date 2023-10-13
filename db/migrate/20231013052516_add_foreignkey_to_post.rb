class AddForeignkeyToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :bookmark, null: true, foreign_key: true
  end
end
