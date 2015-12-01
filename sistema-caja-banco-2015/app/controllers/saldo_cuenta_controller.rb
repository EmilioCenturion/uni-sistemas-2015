class SaldoCuentaController < ApplicationController
  before_action :set_saldo_cuentum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @saldo_cuenta = SaldoCuentum.all
    respond_with(@saldo_cuenta)
  end

  def show
    respond_with(@saldo_cuentum)
  end

  def new
    @saldo_cuentum = SaldoCuentum.new
    respond_with(@saldo_cuentum)
  end

  def edit
  end

  def create
    @saldo_cuentum = SaldoCuentum.new(saldo_cuentum_params)
    @saldo_cuentum.save
    respond_with(@saldo_cuentum)
  end

  def update
    @saldo_cuentum.update(saldo_cuentum_params)
    respond_with(@saldo_cuentum)
  end

  def destroy
    @saldo_cuentum.destroy
    respond_with(@saldo_cuentum)
  end

  private
    def set_saldo_cuentum
      @saldo_cuentum = SaldoCuentum.find(params[:id])
    end

    def saldo_cuentum_params
      params.require(:saldo_cuentum).permit(:saldo_debe, :saldo_haber, :fecha, :cuenta_contable_id, :periodo_fiscal_id)
    end
end
