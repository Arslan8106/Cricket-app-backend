class ChangeTeamNameToUnique < ActiveRecord::Migration[7.0]
  def change
    change_column :teams, :name, :string, unique: true
    add_index :teams, :name, unique: true
  end
end
