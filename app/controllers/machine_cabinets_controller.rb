class MachineCabinetsController < ApplicationController

  def index
    @machine_cabinets = MachineCabinet.all
  end

  def new
    @machine_cabinet=MachineCabinet.new
  end

  def show
    @machine_cabinet=MachineCabinet.find(params[:id])
  end

  def create
    @machine_cabinet = MachineCabinet.new(machine_cabinet_params)
    if @machine_cabinet.save
      redirect_to @machine_cabinet
    else
      render 'new'
    end
  end

  private

    def machine_cabinet_params
      params.require(:machine_cabinet).permit(:number)
    end
end
