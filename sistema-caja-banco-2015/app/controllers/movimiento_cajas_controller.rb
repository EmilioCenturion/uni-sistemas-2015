class MovimientoCajasController < ApplicationController
  load_and_authorize_resource
  before_action :set_movimiento_caja, only: [:show, :edit, :update, :destroy]

  # GET /movimiento_cajas
  # GET /movimiento_cajas.json
  def index
    @motivo_movimiento_cajas = MotivoMovimientoCaja.all
    @motivo_movimiento_caja = MotivoMovimientoCaja.new
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_cajas = @apertura_caja.movimiento_cajas

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movimiento_cajas }
    end
  end

  # GET /movimiento_cajas/1
  # GET /movimiento_cajas/1.json
  def show
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movimiento_caja }
    end
  end

  # GET /movimiento_cajas/new
  def new
    @motivo_movimiento_cajas = MotivoMovimientoCaja.all
    @motivo_movimiento_caja = MotivoMovimientoCaja.new
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movimiento_caja }
    end
  end

  # GET /movimiento_cajas/1/edit
  def edit
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.find(params[:id])
  end

  # POST /movimiento_cajas
  # POST /movimiento_cajas.json
  def create
     @motivo_movimiento_cajas = MotivoMovimientoCaja.all
    @motivo_movimiento_caja = MotivoMovimientoCaja.new
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.create(movimiento_caja_params)
    respond_to do |format|
      if @movimiento_caja.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource movimiento_caja
        format.html { redirect_to(new_apertura_caja_movimiento_caja_url, :notice => 'movimiento_caja was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource movimiento_caja
        format.xml  { render :xml => @movimiento_caja, :status => :created, :location => [@movimiento_caja.apertura_caja, @movimiento_caja] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movimiento_caja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimiento_cajas/1
  # PATCH/PUT /movimiento_cajas/1.json
  def update
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.find(params[:id])

    respond_to do |format|
      if @movimiento_caja.update_attributes(params[:movimiento_caja])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource movimiento_caja
        format.html { redirect_to([@movimiento_caja.apertura_caja, @movimiento_caja], :notice => 'movimiento_caja was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movimiento_caja.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movimiento_cajas/1
  # DELETE /movimiento_cajas/1.json
  def destroy
    @apertura_caja = AperturaCaja.find(params[:apertura_caja_id])
    @movimiento_caja = @apertura_caja.movimiento_cajas.find(params[:id])
    @movimiento_caja.destroy

    respond_to do |format|
      #1st argument reference the path /apertura_cajas/:apertura_caja_id/movimiento_cajas/
      format.html { redirect_to(apertura_caja_movimiento_cajas_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento_caja
      @movimiento_caja = MovimientoCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_caja_params
      params.require(:movimiento_caja).permit(:apertura_caja_id, :motivo_movimiento_caja_id, :descripcion, :es_ingreso, :monto_efectivo, :monto_cheque, :fecha, cheque_recibidos_attributes: [:id, :nro_cheque, :banco_id, :monto, :fecha, :concepto, :cliente_id, :depositado])
    end
end
