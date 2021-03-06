class ComputersController < ApplicationController

  def index
    #@computers = Computer.paginate(:per_page => 10, page: params[:page])
    @search = Search.new
    if params[:search]
      @computers = @computers ||= find_computers
      @search = Search.new(search_params)
    else
      @computers = Computer.all
    end
    logger.debug "haha in index"
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
      params.require(:computer).permit(:asset_number, :sn, :ip,:idrac_ip, :machine_cabinet_id, {project_ids: [] })
    end

    def search_params
      params.require(:search).permit(:machine_cabinet_id, :model_id, :sa_id, :switch_id, :location_id)
    end

def find_computers
  Computer.find(:all, :conditions => conditions)
end

def machine_cabinet_conditions
  logger.debug "haha in  1 #{params[:search][:machine_cabinet_id]}"
  ["computers.machine_cabinet_id = ?", params[:search][:machine_cabinet_id] ] unless params[:search][:machine_cabinet_id].blank?
end

def model_conditions
  logger.debug "haha in  1 #{params[:search][:machine_cabinet_id]}"
  ["computers.model_id = ?", params[:search][:model_id] ] unless params[:search][:model_id].blank?
end

def sa_conditions
  logger.debug "haha in  1 #{params[:search][:machine_cabinet_id]}"
  ["computers.sa_id = ?", params[:search][:sa_id] ] unless params[:search][:sa_id].blank?
end

def switch_conditions
  logger.debug "haha in  1 #{params[:search][:machine_cabinet_id]}"
  ["computers.switch_id = ?", params[:search][:switch_id] ] unless params[:search][:switch_id].blank?
end

def location_conditions
  logger.debug "haha in  1 #{params[:search][:machine_cabinet_id]}"
  ["computers.location_id = ?", params[:search][:location_id] ] unless params[:search][:location_id].blank?
end

def conditions
  logger.debug "haha in conditions"
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  logger.debug "haha in conditions_clauses"
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  logger.debug "haha in conditions_options"
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  logger.debug "haha in conditions_parts"
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end
end
