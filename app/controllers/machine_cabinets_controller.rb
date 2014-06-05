class MachineCabinetsController < ApplicationController
  def new
    @machine_cabinet=MachineCabinet.new
  end
end
