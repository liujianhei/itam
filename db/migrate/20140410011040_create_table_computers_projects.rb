class CreateTableComputersProjects < ActiveRecord::Migration
  def change
    create_table :computers_projects do |t|
      t.belongs_to :computer
      t.belongs_to :project
    end
  end
end
