class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :machine_cabinet_id
      t.integer :model_id
      t.integer :sa_id
      t.integer :switch_id
      t.integer :location_id

      t.timestamps
    end
  end
end
