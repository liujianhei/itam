class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.name :string
      t.description :string

      t.timestamps
    end
  end
end