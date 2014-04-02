class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :asset_number
      t.string :sn
      t.string :ip
      t.string :idrac_ip

      t.timestamps
    end
  end
end
