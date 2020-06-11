class AddImageNameToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :image_name, :string
  end
end
