class HearthstoneController < ApplicationController
  def zuka
    @cards = Card.all
  end
  def index
  end
  def show
    @card = Card.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
