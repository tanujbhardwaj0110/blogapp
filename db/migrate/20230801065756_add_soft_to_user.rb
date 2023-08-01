class AddSoftToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :posts , :soft , :boolean
  end
end
