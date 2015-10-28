class ChequeRecibidosController < ApplicationController
  before_action :set_cheque_recibido, only: [:show, :edit, :update, :destroy]

  # GET /cheque_recibidos
  # GET /cheque_recibidos.json
  def index
    @cheque_recibidos = ChequeRecibido.all
  end

  # GET /cheque_recibidos/1
  # GET /cheque_recibidos/1.json
  def show
  end

  # GET /cheque_recibidos/new
  def new
    @cheque_recibido = ChequeRecibido.new
  end

  # GET /cheque_recibidos/1/edit
  def edit
  end

  # POST /cheque_recibidos
  # POST /cheque_recibidos.json
  def create
    @cheque_recibido = ChequeRecibido.new(cheque_recibido_params)

    respond_to do |format|
      if @cheque_recibido.save
        format.html { redirect_to @cheque_recibido, notice: 'Cheque recibido was successfully created.' }
        format.json { render :show, status: :created, location: @cheque_recibido }
      else
        format.html { render :new }
        format.json { render json: @cheque_recibido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheque_recibidos/1
  # PATCH/PUT /cheque_recibidos/1.json
  def update
    respond_to do |format|
      if @cheque_recibido.update(cheque_recibido_params)
        format.html { redirect_to @cheque_recibido, notice: 'Cheque recibido was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque_recibido }
      else
        format.html { render :edit }
        format.json { render json: @cheque_recibido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheque_recibidos/1
  # DELETE /cheque_recibidos/1.json
  def destroy
    @cheque_recibido.destroy
    respond_to do |format|
      format.html { redirect_to cheque_recibidos_url, notice: 'Cheque recibido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque_recibido
      @cheque_recibido = ChequeRecibido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_recibido_params
      params.require(:cheque_recibido).permit(:nro_cheque, :banco_id, :monto, :fecha, :concepto, :cliente_id)
    end
end
