class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :name

      t.timestamps
    end
  end
end
