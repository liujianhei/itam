class ChangeColumnLocationToComputers < ActiveRecord::Migration
  def change
    remove_column :computers, :location, :string
    add_column :computers, :location_id, :integer
  end
end
