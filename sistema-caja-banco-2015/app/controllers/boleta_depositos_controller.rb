class BoletaDepositosController < ApplicationController
  load_and_authorize_resource
  before_action :set_boleta_deposito, only: [:show, :edit, :update, :destroy]

  # GET /boleta_depositos
  # GET /boleta_depositos.json
  def index
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_depositos = @apertura_caja.boleta_depositos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boleta_depositos }
    end
  end

  # GET /boleta_depositos/1
  # GET /boleta_depositos/1.json
  def show
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boleta_deposito }
    end
  end

  # GET /boleta_depositos/new
  def new
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boleta_deposito }
    end
  end

  # GET /boleta_depositos/1/edit
  def edit
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.find(params[:id])
  end

  # POST /boleta_depositos
  # POST /boleta_depositos.json
  def create
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.create(boleta_deposito_params)
    respond_to do |format|
      if @boleta_deposito.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource boleta_deposito
        format.html { redirect_to(new_apertura_caja_boleta_deposito_url, :success => 'Creaste una deposito correctamente.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource boleta_deposito
        format.xml  { render :xml => @boleta_deposito, :status => :created, :location => [@boleta_deposito.apertura_caja, @boleta_deposito] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boleta_deposito.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boleta_depositos/1
  # PATCH/PUT /boleta_depositos/1.json
  def update
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.find(params[:id])

    respond_to do |format|
      if @boleta_deposito.update_attributes(params[:boleta_deposito])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource boleta_deposito
        format.html { redirect_to([@boleta_deposito.apertura_caja, @boleta_deposito], :success => 'Editaste un deposito correctamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boleta_deposito.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boleta_depositos/1
  # DELETE /boleta_depositos/1.json
  def destroy
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @boleta_deposito = @apertura_caja.boleta_depositos.find(params[:id])
    @boleta_deposito.destroy

    respond_to do |format|
      #1st argument reference the path /apertura_cajas/:apertura_caja_id/boleta_depositos/
      format.html { redirect_to(apertura_caja_boleta_depositos_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boleta_deposito
      @boleta_deposito = BoletaDeposito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boleta_deposito_params
      params.require(:boleta_deposito).permit(:nro_boleta, :monto_efectivo, :monto_cheque, :fecha, :cuenta_id, :apertura_caja_id, boleta_deposito_detalles_attributes: [:id, :cheque_recibido_id])
    end
end

