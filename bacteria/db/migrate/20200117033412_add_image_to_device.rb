class AddImageToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :image, :string
  end
end
