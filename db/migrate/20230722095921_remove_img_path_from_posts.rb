class RemoveImgPathFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :img_path, :string
  end
end
