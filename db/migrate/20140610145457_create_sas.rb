class CreateSas < ActiveRecord::Migration
  def change
    create_table :sas do |t|
      t.string :name

      t.timestamps
    end
  end
end
