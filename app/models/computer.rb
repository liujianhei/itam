class Computer < ActiveRecord::Base
  belongs_to :machine_cabinet
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Computer.create! row.to_hash
    end
  end
end
