class SasController < ApplicationController
  before_action :set_sa, only: [:show, :edit, :update, :destroy]

  # GET /sas
  # GET /sas.json
  def index
    @sas = Sa.all
  end

  # GET /sas/1
  # GET /sas/1.json
  def show
  end

  # GET /sas/new
  def new
    @sa = Sa.new
  end

  # GET /sas/1/edit
  def edit
  end

  # POST /sas
  # POST /sas.json
  def create
    @sa = Sa.new(sa_params)

    respond_to do |format|
      if @sa.save
        format.html { redirect_to @sa, notice: 'Sa was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sa }
      else
        format.html { render action: 'new' }
        format.json { render json: @sa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sas/1
  # PATCH/PUT /sas/1.json
  def update
    respond_to do |format|
      if @sa.update(sa_params)
        format.html { redirect_to @sa, notice: 'Sa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sas/1
  # DELETE /sas/1.json
  def destroy
    @sa.destroy
    respond_to do |format|
      format.html { redirect_to sas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sa
      @sa = Sa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sa_params
      params.require(:sa).permit(:name)
    end
end
