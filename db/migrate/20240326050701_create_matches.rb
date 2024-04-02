class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :venue
      t.datetime :match_time
      t.date :match_date
      t.integer :overs
      t.integer :match_no
      t.references :team1, foreign_key: { to_table: :teams }
      t.references :team2, foreign_key: { to_table: :teams }
      t.timestamps
    end
  end
end
