class WelcomeController < ApplicationController
	before_action :set_short_link, only: [:show, :edit, :update, :destroy]

  def index
    @short_links = ShortLink.all
  end

end
