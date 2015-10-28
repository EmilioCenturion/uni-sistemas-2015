class ChequerasController < ApplicationController
  before_action :set_chequera, only: [:show, :edit, :update, :destroy]

  # GET /chequeras
  # GET /chequeras.json
  def index
    @chequeras = Chequera.all
  end

  # GET /chequeras/1
  # GET /chequeras/1.json
  def show
  end

  # GET /chequeras/new
  def new
    @chequera = Chequera.new
  end

  # GET /chequeras/1/edit
  def edit
  end

  # POST /chequeras
  # POST /chequeras.json
  def create
    @chequera = Chequera.new(chequera_params)

    respond_to do |format|
      if @chequera.save
        format.html { redirect_to @chequera, notice: 'Chequera was successfully created.' }
        format.json { render :show, status: :created, location: @chequera }
      else
        format.html { render :new }
        format.json { render json: @chequera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chequeras/1
  # PATCH/PUT /chequeras/1.json
  def update
    respond_to do |format|
      if @chequera.update(chequera_params)
        format.html { redirect_to @chequera, notice: 'Chequera was successfully updated.' }
        format.json { render :show, status: :ok, location: @chequera }
      else
        format.html { render :edit }
        format.json { render json: @chequera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chequeras/1
  # DELETE /chequeras/1.json
  def destroy
    @chequera.destroy
    respond_to do |format|
      format.html { redirect_to chequeras_url, notice: 'Chequera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chequera
      @chequera = Chequera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chequera_params
      params.require(:chequera).permit(:nro_primero, :nro_ultimo, :cuentum_id, :personal_id, :estado)
    end
end
