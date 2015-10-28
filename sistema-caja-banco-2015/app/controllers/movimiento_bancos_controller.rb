class MovimientoBancosController < ApplicationController
  before_action :set_movimiento_banco, only: [:show, :edit, :update, :destroy]

  # GET /movimiento_bancos
  # GET /movimiento_bancos.json
  def index
    @movimiento_bancos = MovimientoBanco.all
  end

  # GET /movimiento_bancos/1
  # GET /movimiento_bancos/1.json
  def show
  end

  # GET /movimiento_bancos/new
  def new
    @movimiento_banco = MovimientoBanco.new
  end

  # GET /movimiento_bancos/1/edit
  def edit
  end

  # POST /movimiento_bancos
  # POST /movimiento_bancos.json
  def create
    @movimiento_banco = MovimientoBanco.new(movimiento_banco_params)

    respond_to do |format|
      if @movimiento_banco.save
        format.html { redirect_to @movimiento_banco, notice: 'Movimiento banco was successfully created.' }
        format.json { render :show, status: :created, location: @movimiento_banco }
      else
        format.html { render :new }
        format.json { render json: @movimiento_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimiento_bancos/1
  # PATCH/PUT /movimiento_bancos/1.json
  def update
    respond_to do |format|
      if @movimiento_banco.update(movimiento_banco_params)
        format.html { redirect_to @movimiento_banco, notice: 'Movimiento banco was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimiento_banco }
      else
        format.html { render :edit }
        format.json { render json: @movimiento_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimiento_bancos/1
  # DELETE /movimiento_bancos/1.json
  def destroy
    @movimiento_banco.destroy
    respond_to do |format|
      format.html { redirect_to movimiento_bancos_url, notice: 'Movimiento banco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_banco
      @movimiento_banco = MovimientoBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_banco_params
      params.require(:movimiento_banco).permit(:cuenta_id, :motivo_movimiento_banco_id, :descripcion, :es_ingreso, :monto_efectivo, :monto_cheque, :fecha)
    end
end
