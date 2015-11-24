class CuponEmitidosController < ApplicationController
  load_and_authorize_resource
  before_action :set_cupon_emitido, only: [:show, :edit, :update, :destroy]

  # GET /cupon_emitidos
  # GET /cupon_emitidos.json
  def index
    @cupon_emitidos = CuponEmitido.all
    @cupon_emitido = CuponEmitido.new
  end

  # GET /cupon_emitidos/1
  # GET /cupon_emitidos/1.json
  def show
  end

  # GET /cupon_emitidos/new
  def new
    @cupon_emitido = CuponEmitido.new
  end

  # GET /cupon_emitidos/1/edit
  def edit
    @cheque_emitidos = ChequeEmitido.all
  end

  # POST /cupon_emitidos
  # POST /cupon_emitidos.json
  def create
    @cheque_emitidos = ChequeEmitido.all
    @cupon_emitido = CuponEmitido.new(cupon_emitido_params)

    respond_to do |format|
      if @cupon_emitido.save
        format.html { redirect_to cupon_emitidos_url, notice: 'Cupon emitido was successfully created.' }
        format.json { render :show, status: :created, location: @cupon_emitido }
      else
        format.html { render :new }
        format.json { render json: @cupon_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cupon_emitidos/1
  # PATCH/PUT /cupon_emitidos/1.json
  def update
    respond_to do |format|
      if @cupon_emitido.update(cupon_emitido_params)
        format.html { redirect_to @cupon_emitido, notice: 'Cupon emitido was successfully updated.' }
        format.json { render :show, status: :ok, location: @cupon_emitido }
      else
        format.html { render :edit }
        format.json { render json: @cupon_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cupon_emitidos/1
  # DELETE /cupon_emitidos/1.json
  def destroy
    @cupon_emitido.destroy
    respond_to do |format|
      format.html { redirect_to cupon_emitidos_url, notice: 'Cupon emitido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cupon_emitido
      @cupon_emitido = CuponEmitido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cupon_emitido_params
      params.require(:cupon_emitido).permit(:nro_cupon, :monto, :fecha, :tarjeta_id, :concepto, :proveedor_id)
    end
end
