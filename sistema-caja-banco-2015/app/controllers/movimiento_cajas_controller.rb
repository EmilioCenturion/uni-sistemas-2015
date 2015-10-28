class MovimientoCajasController < ApplicationController
  before_action :set_movimiento_caja, only: [:show, :edit, :update, :destroy]

  # GET /movimiento_cajas
  # GET /movimiento_cajas.json
  def index
    @movimiento_cajas = MovimientoCaja.all
  end

  # GET /movimiento_cajas/1
  # GET /movimiento_cajas/1.json
  def show
  end

  # GET /movimiento_cajas/new
  def new
    @movimiento_caja = MovimientoCaja.new
  end

  # GET /movimiento_cajas/1/edit
  def edit
  end

  # POST /movimiento_cajas
  # POST /movimiento_cajas.json
  def create
    @movimiento_caja = MovimientoCaja.new(movimiento_caja_params)

    respond_to do |format|
      if @movimiento_caja.save
        format.html { redirect_to @movimiento_caja, notice: 'Movimiento caja was successfully created.' }
        format.json { render :show, status: :created, location: @movimiento_caja }
      else
        format.html { render :new }
        format.json { render json: @movimiento_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimiento_cajas/1
  # PATCH/PUT /movimiento_cajas/1.json
  def update
    respond_to do |format|
      if @movimiento_caja.update(movimiento_caja_params)
        format.html { redirect_to @movimiento_caja, notice: 'Movimiento caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimiento_caja }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimiento_cajas/1
  # DELETE /movimiento_cajas/1.json
  def destroy
    @movimiento_caja.destroy
    respond_to do |format|
      format.html { redirect_to movimiento_cajas_url, notice: 'Movimiento caja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_caja
      @movimiento_caja = MovimientoCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_caja_params
      params.require(:movimiento_caja).permit(:apertura_caja_id, :motivo_movimiento_caja_id, :descripcion, :es_ingreso, :monto_efectivo, :monto_cheque, :fecha)
    end
end
