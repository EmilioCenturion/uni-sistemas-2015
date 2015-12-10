class CajasController < ApplicationController
  load_and_authorize_resource
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  # GET /cajas
  # GET /cajas.json
  def index
    @cajas = Caja.all
    @caja = Caja.new
  end

  # GET /cajas/1
  # GET /cajas/1.json
  def show
  end

  # GET /cajas/new
  def new
    @caja = Caja.new
  end

  # GET /cajas/1/edit
  def edit
  end

  # POST /cajas
  # POST /cajas.json
  def create
    @caja = Caja.new

    respond_to do |format|
      if @caja.save
        format.html { redirect_to cajas_url, success: 'Creaste una caja correctamente.' }
        format.json { render :show, status: :created, location: @caja }
      else
        format.html { render :new }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /cajas/1
  # PATCH/PUT /cajas/1.json
  def update
    respond_to do |format|
      if @caja.update(caja_params)
        format.html { redirect_to @caja, success: 'Editaste una caja correctamente.' }
        format.json { render :show, status: :ok, location: @caja }
      else
        format.html { render :edit }
        format.json { render json: @caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cajas/1
  # DELETE /cajas/1.json
  def destroy
    respond_to do |format|
      if @caja.destroy
        format.html { redirect_to cajas_url, success: 'Eliminaste una caja correctamente.' }
        format.json { head :no_content }
      else
        format.html { redirect_to cajas_url, danger: 'Se ha producido un error al eliminar.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caja
      @caja = Caja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caja_params
      params.require(:caja).permit(:nro_caja, :saldo_inicial_efectivo, :saldo_inicial_cheque, :estado)
    end
end
