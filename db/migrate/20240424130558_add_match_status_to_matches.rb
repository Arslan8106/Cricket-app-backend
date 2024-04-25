class AddMatchStatusToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :status, :string
  end
end
