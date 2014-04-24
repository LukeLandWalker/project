class HearthstoneController < ApplicationController
  def zuka
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
  def select
    @cards = Card.where(["belong = ?", params[:belong]])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
