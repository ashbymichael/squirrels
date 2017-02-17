class CreateTrees < ActiveRecord::Migration[5.0]
  def change
    create_table :trees do |t|
      t.integer :age
      t.integer :height
      t.string :growing_season
      t.boolean :dead
      t.string :species

      t.timestamps
    end
  end
end
