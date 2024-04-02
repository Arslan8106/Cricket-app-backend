class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :status, :boolean, default: true
    add_column :users, :department, :string
    add_column :users, :birth_date, :datetime
  end
end
