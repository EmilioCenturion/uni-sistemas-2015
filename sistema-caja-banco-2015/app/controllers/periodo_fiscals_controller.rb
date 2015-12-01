class PeriodoFiscalsController < ApplicationController
  before_action :set_periodo_fiscal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @periodo_fiscals = PeriodoFiscal.all
    respond_with(@periodo_fiscals)
  end

  def show
    respond_with(@periodo_fiscal)
  end

  def new
    @periodo_fiscal = PeriodoFiscal.new
    respond_with(@periodo_fiscal)
  end

  def edit
  end

  def create
    @periodo_fiscal = PeriodoFiscal.new(periodo_fiscal_params)
    @periodo_fiscal.save
    respond_with(@periodo_fiscal)
  end

  def update
    @periodo_fiscal.update(periodo_fiscal_params)
    respond_with(@periodo_fiscal)
  end

  def destroy
    @periodo_fiscal.destroy
    respond_with(@periodo_fiscal)
  end

  private
    def set_periodo_fiscal
      @periodo_fiscal = PeriodoFiscal.find(params[:id])
    end

    def periodo_fiscal_params
      params.require(:periodo_fiscal).permit(:fecha_inicio, :fecha_fin, :anho, :activo)
    end
end
