class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:show, :edit, :update, :destroy]

  # GET /short_links
  # GET /short_links.json
  def index
    @short_links = ShortLink.all
  end

  def show
  end
  
  # Redirect incoming request using short links
  # GET /short_links/:user_short_key
  def reroute_short_link
    @short_link = ShortLink.find_by(user_short_key: params[:user_short_key])

    redirect_to @short_link.destination_url
  end

  # GET /short_links/new
  def new
    @short_link = ShortLink.new
  end

  # GET /short_links/1/edit
  def edit
  end

  # POST /short_links
  # POST /short_links.json
  def create
    @short_link = ShortLink.new(short_link_params)

    respond_to do |format|
      if @short_link.save
        format.html { redirect_to @short_link, notice: 'Short link was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @short_link }
      else
        format.html { render :new }
        format.js   { render template: 'short_links/errors.js.erb' }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /short_links/1
  # PATCH/PUT /short_links/1.json
  def update
    respond_to do |format|
      if @short_link.update(short_link_params)
        format.html { redirect_to @short_link, notice: 'Short link was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_link }
      else
        format.html { render :edit }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_links/1
  # DELETE /short_links/1.json
  def destroy
    @short_link.destroy
    respond_to do |format|
      format.html { redirect_to short_links_url, notice: 'Short link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_link
      @short_link = ShortLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_link_params
      params.require(:short_link).permit(:user_short_key, :destination_url, :http_status)
    end
end
