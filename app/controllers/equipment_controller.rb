class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.where(hospital_id: params[:hospital_id], approved: true)
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @hospital = Hospital.find_by(id: params[:hospital_id])
    @equipment = Equipment.new
    render layout: false
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @hospital = Hospital.find_by(params[:hospital_id])
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
	block_prepare(@equipment,["equipment_id": @equipment.id,"add": true])
        redirect_to @hospital
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:category, :number, :hospital_id)
    end
end
