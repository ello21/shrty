class WelcomeController < ApplicationController
	before_action :set_short_link, only: [:show, :edit, :update, :destroy]

  def index
    @short_links = ShortLink.all
    @short_link = ShortLink.new

    @text_messages = TextMessage.all
    @text_message = TextMessage.new
  end

end
