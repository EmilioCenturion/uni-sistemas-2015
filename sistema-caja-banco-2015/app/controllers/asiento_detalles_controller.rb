class AsientoDetallesController < ApplicationController
  before_action :set_asiento_detalle, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asiento_detalles = AsientoDetalle.all
    respond_with(@asiento_detalles)
  end

  def show
    respond_with(@asiento_detalle)
  end

  def new
    @asiento_detalle = AsientoDetalle.new
    respond_with(@asiento_detalle)
  end

  def edit
  end

  def create
    @asiento_detalle = AsientoDetalle.new(asiento_detalle_params)
    @asiento_detalle.save
    respond_with(@asiento_detalle)
  end

  def update
    @asiento_detalle.update(asiento_detalle_params)
    respond_with(@asiento_detalle)
  end

  def destroy
    @asiento_detalle.destroy
    respond_with(@asiento_detalle)
  end

  private
    def set_asiento_detalle
      @asiento_detalle = AsientoDetalle.find(params[:id])
    end

    def asiento_detalle_params
      params.require(:asiento_detalle).permit(:asiento_id, :cuenta_contable_id, :importe, :es_credito, :concepto)
    end
end
