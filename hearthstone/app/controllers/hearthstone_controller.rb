class HearthstoneController < ApplicationController
  def zuka
  end
  def index
  end
  def show
    @card = Card.find(params[:id])
    @newCard = TempSet.new
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
  def add
    @newCard = TempSet.new
    @cardArray = Array.new
    @newCard.card_id = params[:id]
    @newCard.number = 1
    @oldCard = TempSet.find_by_card_id(@newCard.card_id)
    if @oldCard.nil?
      @newCard.save
    else
      if @oldCard.number == 1
	@oldCard.update_attribute('number', 2)
        @oldCard.save
      end
    end      
    
    @TempCards = TempSet.all
    @TempCards.each do |card|
      @cardArray.push(Card.find(card.card_id))
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def view
    @viewCards = Card.all
    respond_to do |format|
      format.html
      format.js
    end
  end
end
