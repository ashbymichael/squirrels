class AddUserToSquirrels < ActiveRecord::Migration[5.0]
  def change
    add_reference :squirrels, :user, foreign_key: true
  end
end
