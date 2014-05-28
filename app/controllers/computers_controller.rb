class ComputersController < ApplicationController

  def index
    @computers = Computer.all
    respond_to do |format|
      format.html
      format.js
    end 
  end

  def new
    @computer = Computer.new
  end

  def create
    @computer = Computer.new(computer_params)
    if @computer.save
      redirect_to @computer
    else
      render 'new'
    end
  end

  def show
    @computer = Computer.find(params[:id])
  end

  def edit
    @computer = Computer.find(params[:id])
  end

  def update
    @computer = Computer.find(params[:id])
    if @computer.update_attributes(computer_params)
      redirect_to @computer
    else
      render 'edit'
    end
  end

  def destroy
    Computer.find(params[:id]).destroy
    redirect_to computers_url
  end

  def import
    Computer.import(params[:file])
    redirect_to computers_path
  end

  def delete_multiple
    Computer.where(id: params[:computer_ids]).destroy_all
    respond_to do |format|
      format.html { redirect_to computers_path }
      format.js
    end 
  end

  private

    def computer_params
      params.require(:computer).permit(:asset_number, :sn, :ip,:idrac_ip, :machie_cabinet_id, {project_ids: [] })
    end
end
