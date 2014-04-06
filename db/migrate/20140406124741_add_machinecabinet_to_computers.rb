class AddMachinecabinetToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :machinecabinet_id, :integer
  end
end
