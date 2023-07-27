class RemoveImgFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :img, :string
  end
end
