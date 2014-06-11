class Computer < ActiveRecord::Base
  belongs_to :machine_cabinet
  belongs_to :model
  belongs_to :sa
  belongs_to :switch
  belongs_to :location
  has_and_belongs_to_many :projects
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Computer.create! row.to_hash
    end
  end
end
