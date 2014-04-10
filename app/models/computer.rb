class Computer < ActiveRecord::Base
  belongs_to :machine_cabinet
  has_and_belongs_to_many :projects
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Computer.create! row.to_hash
    end
  end
end
