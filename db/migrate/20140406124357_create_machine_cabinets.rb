class CreateMachineCabinets < ActiveRecord::Migration
  def change
    create_table :machine_cabinets do |t|
      t.string :number

      t.timestamps
    end
  end
end
