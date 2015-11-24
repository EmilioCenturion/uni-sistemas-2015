class ChequerasController < ApplicationController
  load_and_authorize_resource
  before_action :set_chequera, only: [:show, :edit, :update, :destroy]

  # GET /chequeras
  # GET /chequeras.json
  def index
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequeras = @cuentum.chequeras
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chequeras}
    end
  end

  # GET /chequeras/1
  # GET /chequeras/1.json
  def show
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chequera }
    end
  end

  # GET /chequeras/new
  def new
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chequera }
    end
  end

  # GET /chequeras/1/edit
  def edit
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.find(params[:id])
  end

  # POST /chequeras
  # POST /chequeras.json
  def create
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.create(chequera_params)
    respond_to do |format|
      if @chequera.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to( cuentum_chequeras_url, :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @chequera, :status => :created, :location => [@chequera.cuentum, @chequera] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chequera.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chequeras/1
  # PATCH/PUT /chequeras/1.json
  def update
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.find(params[:id])

    respond_to do |format|
      if @chequera.update(chequera_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to(cuentum_chequeras_url, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chequera.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chequeras/1
  # DELETE /chequeras/1.json
  def destroy
    @cuentum = Cuentum.find(params[:cuentum_id])
    @chequera = @cuentum.chequeras.find(params[:id])
    @chequera.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(cuentum_chequeras_url) }
      format.xml  { head :ok }
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