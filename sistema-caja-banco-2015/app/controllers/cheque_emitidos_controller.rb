class ChequeEmitidosController < ApplicationController
  load_and_authorize_resource
  before_action :set_cheque_emitido, only: [:show, :edit, :update, :destroy]

  # GET /cheque_emitidos
  # GET /cheque_emitidos.json
  def index
    @cheque_emitidos = ChequeEmitido.all
    @cheque_emitido = ChequeEmitido.new
  
  end

  # GET /cheque_emitidos/1
  # GET /cheque_emitidos/1.json
  def show
  end

  # GET /cheque_emitidos/new
  def new
    @cheque_emitido = ChequeEmitido.new
  end

  # GET /cheque_emitidos/1/edit
  def edit
    @cheque_emitidos = ChequeEmitido.all
  end

  # POST /cheque_emitidos
  # POST /cheque_emitidos.json
  def create
    @cheque_emitidos = ChequeEmitido.all
    @cheque_emitido = ChequeEmitido.new(cheque_emitido_params)

    respond_to do |format|
      if @cheque_emitido.save
        format.html { redirect_to cheque_emitidos_url, notice: 'Cheque emitido was successfully created.' }
        format.json { render :show, status: :created, location: @cheque_emitido }
      else
        format.html { render :new }
        format.json { render json: @cheque_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheque_emitidos/1
  # PATCH/PUT /cheque_emitidos/1.json
  def update
    respond_to do |format|
      if @cheque_emitido.update(cheque_emitido_params)
        format.html { redirect_to @cheque_emitido, notice: 'Cheque emitido was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque_emitido }
      else
        format.html { render :edit }
        format.json { render json: @cheque_emitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheque_emitidos/1
  # DELETE /cheque_emitidos/1.json
  def destroy
    @cheque_emitido.destroy
    respond_to do |format|
      format.html { redirect_to cheque_emitidos_url, notice: 'Cheque emitido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_emitido
      @cheque_emitido = ChequeEmitido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_emitido_params
      params.require(:cheque_emitido).permit(:nro_cheque, :monto, :fecha, :chequera_id, :proveedor_id, :concepto)
    end
end
