class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  # GET /credits
  # GET /credits.json
  def index
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credits = @cuentum.credits
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @credits}
    end
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @credit }
    end
  end

  # GET /credits/new
  def new
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @credit }
    end
  end

  # GET /credits/1/edit
  def edit
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.find(params[:id])
  end

  # POST /credits
  # POST /credits.json
  def create
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.create(credit_params)
    respond_to do |format|
      if @credit.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to( cuentum_credits_url, :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @credit, :status => :created, :location => [@credit.cuentum, @credit] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.find(params[:id])

    respond_to do |format|
      if @credit.update(credit_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to(cuentum_credits_url, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @credit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @cuentum = Cuentum.find(params[:cuentum_id])
    @credit = @cuentum.credits.find(params[:id])
    @credit.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(cuentum_credits_url) }
      format.xml  { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:nro_tarjeta, :cuentum_id, :personal_id)
    end
end
