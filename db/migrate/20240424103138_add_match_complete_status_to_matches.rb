class AddMatchCompleteStatusToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :completed, :boolean, default: false
  end
end
