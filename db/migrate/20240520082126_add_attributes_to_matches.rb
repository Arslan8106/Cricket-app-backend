class AddAttributesToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :team1_name, :string
    add_column :matches, :team1_score, :integer
    add_column :matches, :team1_overs, :integer
    add_column :matches, :team1_wickets, :integer
    add_column :matches, :team2_name, :string
    add_column :matches, :team2_score, :integer
    add_column :matches, :team2_overs, :integer
    add_column :matches, :team2_wickets, :integer
  end
end
