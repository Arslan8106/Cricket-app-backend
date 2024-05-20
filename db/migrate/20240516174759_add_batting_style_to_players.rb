class AddBattingStyleToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :batting_style, :string
  end
end
