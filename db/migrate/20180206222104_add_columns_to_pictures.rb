class AddColumnsToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :image, :text
    add_column :pictures, :content, :text
  end
end
