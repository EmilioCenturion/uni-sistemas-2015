class MotivoMovimientoBancosController < ApplicationController
  before_action :set_motivo_movimiento_banco, only: [:show, :edit, :update, :destroy]

  # GET /motivo_movimiento_bancos
  # GET /motivo_movimiento_bancos.json
  def index
    @motivo_movimiento_bancos = MotivoMovimientoBanco.all
    @motivo_movimiento_banco = MotivoMovimientoBanco.new
  end

  # GET /motivo_movimiento_bancos/1
  # GET /motivo_movimiento_bancos/1.json
  def show
  end

  # GET /motivo_movimiento_bancos/new
  def new
    @motivo_movimiento_banco = MotivoMovimientoBanco.new
  end

  # GET /motivo_movimiento_bancos/1/edit
  def edit
  end

  # POST /motivo_movimiento_bancos
  # POST /motivo_movimiento_bancos.json
  def create
    @motivo_movimiento_banco = MotivoMovimientoBanco.new(motivo_movimiento_banco_params)

    respond_to do |format|
      if @motivo_movimiento_banco.save
        format.html { redirect_to @motivo_movimiento_banco, notice: 'Motivo movimiento banco was successfully created.' }
        format.json { render :show, status: :created, location: @motivo_movimiento_banco }
        format.js   { render action: 'show', status: :created, location: @motivo_movimiento_banco }
      else
        format.html { render :new }
        format.json { render json: @motivo_movimiento_banco.errors, status: :unprocessable_entity }
        format.js   { render json: @motivo_movimiento_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivo_movimiento_bancos/1
  # PATCH/PUT /motivo_movimiento_bancos/1.json
  def update
    respond_to do |format|
      if @motivo_movimiento_banco.update(motivo_movimiento_banco_params)
        format.html { redirect_to @motivo_movimiento_banco, notice: 'Motivo movimiento banco was successfully updated.' }
        format.json { render :show, status: :ok, location: @motivo_movimiento_banco }
      else
        format.html { render :edit }
        format.json { render json: @motivo_movimiento_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_movimiento_bancos/1
  # DELETE /motivo_movimiento_bancos/1.json
  def destroy
    @motivo_movimiento_banco.destroy
    respond_to do |format|
      format.html { redirect_to motivo_movimiento_bancos_url, notice: 'Motivo movimiento banco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivo_movimiento_banco
      @motivo_movimiento_banco = MotivoMovimientoBanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivo_movimiento_banco_params
      params.require(:motivo_movimiento_banco).permit(:descripcion)
    end
end
