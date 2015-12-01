class CuentaContablesController < ApplicationController
  before_action :set_cuenta_contable, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cuenta_contables = CuentaContable.all
    respond_with(@cuenta_contables)
  end

  def show
    respond_with(@cuenta_contable)
  end

  def new
    @cuenta_contable = CuentaContable.new
    respond_with(@cuenta_contable)
  end

  def edit
  end

  def create
    @cuenta_contable = CuentaContable.new(cuenta_contable_params)
    @cuenta_contable.save
    respond_with(@cuenta_contable)
  end

  def update
    @cuenta_contable.update(cuenta_contable_params)
    respond_with(@cuenta_contable)
  end

  def destroy
    @cuenta_contable.destroy
    respond_with(@cuenta_contable)
  end

  private
    def set_cuenta_contable
      @cuenta_contable = CuentaContable.find(params[:id])
    end

    def cuenta_contable_params
      params.require(:cuenta_contable).permit(:tipo_cuenta, :nivel_cuenta, :codigo_cuenta, :descripcion)
    end
end
