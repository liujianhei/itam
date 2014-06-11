class AddItemsToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :model_id, :integer
    add_column :computers, :sa_id, :integer
    add_column :computers, :switch_id, :integer
    add_column :computers, :switch_port, :string
    add_column :computers, :hardware_info, :string
    add_column :computers, :mac_addr, :string
    add_column :computers, :expired_at, :string
    add_column :computers, :location, :string
  end
end
