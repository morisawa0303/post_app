class AddColumImagePath < ActiveRecord::Migration[5.2]
  def change
    add_column :posts,:image_path ,:string
    drop_table :images
  end
end
