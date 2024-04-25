class AddAdditionalAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :player_type, :string
    add_column :users, :age, :string
  end
end
