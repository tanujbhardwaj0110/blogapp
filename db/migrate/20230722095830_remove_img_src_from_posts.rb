class RemoveImgSrcFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :img_src, :string
  end
end
