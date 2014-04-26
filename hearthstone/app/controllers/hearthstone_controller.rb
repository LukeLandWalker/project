class HearthstoneController < ApplicationController
  def new
    @cardSet = CardSet.new
  end
  def index
  end
  def check
    @cardSets = CardSet.all
  end
  def checkeach
    @cardSet = CardSet.find_by_name(params[:name])
    @cards = SetInfo.where("set_name = ?", params[:name]).all
    @cardArray = Array.new
    @number = 0
    @cards.each do |card|
      @cardArray.push(Card.find(card.card_id))
      @number += card.number
    end
    respond_to do |format|
      format.html
      format.js
    end
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
    @oldCard
    @TempCards
    @number = 0
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
    
    TempSet.order("card_id")
    @TempCards = TempSet.all
    @TempCards.each do |card|
      @cardArray.push(Card.find(card.card_id))
      @number += card.number
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def decrease
    @cardArray = Array.new
    @TempCards
    @number = 0
    @oldCard = TempSet.find_by_card_id(params[:id])
    if @oldCard.nil?
    else
      if @oldCard.number == 1
        @oldCard.destroy
      else
	@oldCard.update_attribute('number', 1)
        @oldCard.save
      end
    end

    TempSet.order("card_id")
    @TempCards = TempSet.all
    @TempCards.each do |card|
      @cardArray.push(Card.find(card.card_id))
      @number += card.number
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  def create
    @cardSet = CardSet.new
    @cardSet.name = params[:name]
    @cardSet.description = params[:description]
    @TempCards = TempSet.all
    if CardSet.find_by_name(@cardSet.name).nil? && @TempCards.size > 0
      @TempCards.each do |card|
        @CardofSet = SetInfo.new
        @CardofSet.set_name = @cardSet.name
        @CardofSet.card_id = card.card_id
        @CardofSet.number = card.number
        @CardofSet.save
        card.destroy
      end
      @cardSet.save
      redirect_to :action => :index
    else
      @TempCards.each do |card|
        card.destroy
      end
    end
  end
end
