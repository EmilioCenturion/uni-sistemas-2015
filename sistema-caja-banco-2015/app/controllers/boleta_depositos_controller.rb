class BoletaDepositosController < ApplicationController
  before_action :set_boleta_deposito, only: [:show, :edit, :update, :destroy]

  # GET /boleta_depositos
  # GET /boleta_depositos.json
  def index
    @boleta_depositos = BoletaDeposito.all
  end

  # GET /boleta_depositos/1
  # GET /boleta_depositos/1.json
  def show
  end

  # GET /boleta_depositos/new
  def new
    @boleta_deposito = BoletaDeposito.new
  end

  # GET /boleta_depositos/1/edit
  def edit
  end

  # POST /boleta_depositos
  # POST /boleta_depositos.json
  def create
    @boleta_deposito = BoletaDeposito.new(boleta_deposito_params)

    respond_to do |format|
      if @boleta_deposito.save
        format.html { redirect_to @boleta_deposito, notice: 'Boleta deposito was successfully created.' }
        format.json { render :show, status: :created, location: @boleta_deposito }
      else
        format.html { render :new }
        format.json { render json: @boleta_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boleta_depositos/1
  # PATCH/PUT /boleta_depositos/1.json
  def update
    respond_to do |format|
      if @boleta_deposito.update(boleta_deposito_params)
        format.html { redirect_to @boleta_deposito, notice: 'Boleta deposito was successfully updated.' }
        format.json { render :show, status: :ok, location: @boleta_deposito }
      else
        format.html { render :edit }
        format.json { render json: @boleta_deposito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boleta_depositos/1
  # DELETE /boleta_depositos/1.json
  def destroy
    @boleta_deposito.destroy
    respond_to do |format|
      format.html { redirect_to boleta_depositos_url, notice: 'Boleta deposito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boleta_deposito
      @boleta_deposito = BoletaDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boleta_deposito_params
      params.require(:boleta_deposito).permit(:nro_boleta, :monto_efectivo, :monto_cheque, :fecha, :cuenta_id, :apertura_caja_id)
    end
end
