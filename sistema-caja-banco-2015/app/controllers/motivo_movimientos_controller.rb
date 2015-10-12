class MotivoMovimientosController < ApplicationController
  before_action :set_motivo_movimiento, only: [:show, :edit, :update, :destroy]

  # GET /motivo_movimientos
  # GET /motivo_movimientos.json
  def index
    @motivo_movimientos = MotivoMovimiento.all
  end

  # GET /motivo_movimientos/1
  # GET /motivo_movimientos/1.json
  def show
  end

  # GET /motivo_movimientos/new
  def new
    @motivo_movimiento = MotivoMovimiento.new
  end

  # GET /motivo_movimientos/1/edit
  def edit
  end

  # POST /motivo_movimientos
  # POST /motivo_movimientos.json
  def create
    @motivo_movimiento = MotivoMovimiento.new(motivo_movimiento_params)

    respond_to do |format|
      if @motivo_movimiento.save
        format.html { redirect_to @motivo_movimiento, notice: 'Motivo movimiento was successfully created.' }
        format.json { render :show, status: :created, location: @motivo_movimiento }
      else
        format.html { render :new }
        format.json { render json: @motivo_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivo_movimientos/1
  # PATCH/PUT /motivo_movimientos/1.json
  def update
    respond_to do |format|
      if @motivo_movimiento.update(motivo_movimiento_params)
        format.html { redirect_to @motivo_movimiento, notice: 'Motivo movimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @motivo_movimiento }
      else
        format.html { render :edit }
        format.json { render json: @motivo_movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_movimientos/1
  # DELETE /motivo_movimientos/1.json
  def destroy
    @motivo_movimiento.destroy
    respond_to do |format|
      format.html { redirect_to motivo_movimientos_url, notice: 'Motivo movimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivo_movimiento
      @motivo_movimiento = MotivoMovimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivo_movimiento_params
      params.require(:motivo_movimiento).permit(:descripcion)
    end
end
