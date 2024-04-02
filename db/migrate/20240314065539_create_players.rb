class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :contact_number
      t.string :email
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
