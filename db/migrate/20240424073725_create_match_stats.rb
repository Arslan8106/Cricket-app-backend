class CreateMatchStats < ActiveRecord::Migration[7.0]
  def change
    create_table :match_stats do |t|
      t.references :team, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.integer :team_score, default: 0
      t.integer :overs
      t.integer :wickets, default: 0

      t.timestamps
    end
  end
end
