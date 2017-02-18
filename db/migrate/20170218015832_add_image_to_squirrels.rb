class AddImageToSquirrels < ActiveRecord::Migration[5.0]
  def change
    add_column :squirrels, :image, :string
    remove_column :squirrels, :number, :integer
  end
end
