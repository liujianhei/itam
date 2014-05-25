module ComputersHelper
  def mc_number_for(computer)
    if computer.machine_cabinet.nil?
      ""
    else
      computer.machine_cabinet.number
    end
  end
end
