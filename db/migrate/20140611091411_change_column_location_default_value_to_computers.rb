class ChangeColumnLocationDefaultValueToComputers < ActiveRecord::Migration
  def change
    change_column :computers, :location_id, :integer, :default => 1
  end
end
