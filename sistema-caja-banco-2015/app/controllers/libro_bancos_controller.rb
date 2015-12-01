class LibroBancosController < ApplicationController
  before_action :set_libro_banco, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @libro_bancos = LibroBanco.all
    respond_with(@libro_bancos)
  end

  def show
    @libro_banco = LibroBanco.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = LibroBancoPdf.new([@libro_banco, current_user.username], view_context)
        send_data pdf.render, filename: "libro_banco_#{@libro_banco.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @libro_banco = LibroBanco.new
    respond_with(@libro_banco)
  end

  def edit
  end

  def create
    @libro_banco = LibroBanco.new(libro_banco_params)
    respond_to do |format|
      if @libro_banco.save
        format.html { redirect_to libro_banco_path([@libro_banco, current_user.username], format: "pdf") }
        format.json { render :show, status: :created, location: @libro_banco }
      else
        format.html { render :new }
        format.json { render json: @libro_banco.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @libro_banco.update(libro_banco_params)
    respond_with(@libro_banco)
  end

  def destroy
    @libro_banco.destroy
    respond_with(@libro_banco)
  end

  private
    def set_libro_banco
      @libro_banco = LibroBanco.find(params[:id])
    end

    def libro_banco_params
      params.require(:libro_banco).permit(:cuenta_id, :fecha_inicio, :fecha_fin)
    end
end
