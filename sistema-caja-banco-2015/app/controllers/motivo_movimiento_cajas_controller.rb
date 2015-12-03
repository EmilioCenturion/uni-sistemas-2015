class MotivoMovimientoCajasController < ApplicationController
  before_action :set_motivo_movimiento_caja, only: [:show, :edit, :update, :destroy]

  # GET /motivo_movimiento_cajas
  # GET /motivo_movimiento_cajas.json
  def index
    @motivo_movimiento_cajas = MotivoMovimientoCaja.all
    @motivo_movimiento_caja = MotivoMovimientoCaja.new
  end

  # GET /motivo_movimiento_cajas/1
  # GET /motivo_movimiento_cajas/1.json
  def show
  end

  # GET /motivo_movimiento_cajas/new
  def new
    @motivo_movimiento_caja = MotivoMovimientoCaja.new
  end

  # GET /motivo_movimiento_cajas/1/edit
  def edit
  end

  # POST /motivo_movimiento_cajas
  # POST /motivo_movimiento_cajas.json
  def create
    @motivo_movimiento_caja = MotivoMovimientoCaja.new(motivo_movimiento_caja_params)

    respond_to do |format|
      if @motivo_movimiento_caja.save
        format.html { redirect_to @motivo_movimiento_caja, notice: 'Motivo movimiento caja was successfully created.' }
        format.json { render :show, status: :created, location: @motivo_movimiento_caja }
        format.js   { render action: 'show', status: :created, location: @motivo_movimiento_caja }
      else
        format.html { render :new }
        format.json { render json: @motivo_movimiento_caja.errors, status: :unprocessable_entity }
        format.js   { render json: @motivo_movimiento_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivo_movimiento_cajas/1
  # PATCH/PUT /motivo_movimiento_cajas/1.json
  def update
    respond_to do |format|
      if @motivo_movimiento_caja.update(motivo_movimiento_caja_params)
        format.html { redirect_to @motivo_movimiento_caja, notice: 'Motivo movimiento caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @motivo_movimiento_caja }
      else
        format.html { render :edit }
        format.json { render json: @motivo_movimiento_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_movimiento_cajas/1
  # DELETE /motivo_movimiento_cajas/1.json
  def destroy
    @motivo_movimiento_caja.destroy
    respond_to do |format|
      format.html { redirect_to motivo_movimiento_cajas_url, notice: 'Motivo movimiento caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivo_movimiento_caja
      @motivo_movimiento_caja = MotivoMovimientoCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivo_movimiento_caja_params
      params.require(:motivo_movimiento_caja).permit(:descripcion)
    end
end

