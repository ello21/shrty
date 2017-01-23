class TextMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_text_message, only: [:show, :edit, :update, :destroy]
  after_action :send_twilio_message, only: [:create]

  # GET /text_messages
  # GET /text_messages.json
  def index
    @text_messages = TextMessage.all
  end

  # GET /text_messages/1
  # GET /text_messages/1.json
  def show
  end

  # GET /text_messages/new
  def new
    @short_link = ShortLink.find(params[:short_link_id])
    @text_message = TextMessage.new(short_link_id: @short_link.id)

    respond_to do |format|
      if @text_message
        format.html { redirect_to @text_message, notice: 'Text message was successfully created.' }
        format.json { render :show, status: :created, location: @text_message }
        format.js   { }
      else
        format.html { render :new }
        format.js   { render template: 'text_messages/errors.js.erb' }
        format.json { render json: @text_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /text_messages/1/edit
  def edit
  end

  # POST /text_messages
  # POST /text_messages.json
  def create
    @text_message = TextMessage.new(text_message_params)
    @text_message.to_phone_number = "+1" + @text_message.to_phone_number
    respond_to do |format|
      if @text_message.save
        session[:phone_number] = @text_message.to_phone_number
        session[:message] = @text_message.message

        format.html { redirect_to @text_message, notice: 'Text message was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @text_message }

      else
        format.html { render :new }
        format.js   { render template: 'text_messages/errors.js.erb' }
        format.json { render json: @text_message.errors, status: :unprocessable_entity }
      end

    end
  end

  def send_twilio_message
   
    client ||= Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    
    twilio_msg = client.messages.create(
      to: session[:phone_number],
      from: Rails.application.secrets.twilio_phone_number,
      body: session[:message]
    )

    # render plain: twilio_msg.status
    puts twilio_msg.status
  end


  # PATCH/PUT /text_messages/1
  # PATCH/PUT /text_messages/1.json
  def update
    respond_to do |format|
      if @text_message.update(text_message_params)
        format.html { redirect_to @text_message, notice: 'Text message was successfully updated.' }
        format.json { render :show, status: :ok, location: @text_message }
      else
        format.html { render :edit }
        format.json { render json: @text_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_messages/1
  # DELETE /text_messages/1.json
  def destroy
    @text_message.destroy
    respond_to do |format|
      format.html { redirect_to text_messages_url, notice: 'Text message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_message
      @text_message = TextMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_message_params
      params.require(:text_message).permit(:message, :from_phone_number, :to_phone_number, :short_link_id)
    end
end
