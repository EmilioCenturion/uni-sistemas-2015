class AsientosController < ApplicationController
  before_action :set_asiento, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @asientos = Asiento.all
    respond_with(@asientos)
  end

  def show
    respond_with(@asiento)
  end

  def new
    @asiento = Asiento.new
    respond_with(@asiento)
  end

  def edit
  end

  def create
    @asiento = Asiento.new(asiento_params)
    @asiento.save
    respond_with(@asiento)
  end

  def update
    @asiento.update(asiento_params)
    respond_with(@asiento)
  end

  def destroy
    @asiento.destroy
    respond_with(@asiento)
  end

  private
    def set_asiento
      @asiento = Asiento.find(params[:id])
    end

    def asiento_params
      params.require(:asiento).permit(:nro_asiento, :fecha, :periodo_fiscal_id)
    end
end
