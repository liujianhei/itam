class RenameColumnToComputers < ActiveRecord::Migration
  def self.up
    rename_column :computers, :machinecabinet_id, :machine_cabinet_id
  end

  def self.down
  end
end
