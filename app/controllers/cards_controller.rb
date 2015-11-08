class CardsController < ApplicationController
  def new
  	@card = Card.new
  end
  
  def create 
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully added.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def index 
    @cards = Card.all  
    @users = User.all
  end 

  def show
  	@card = Card.find(params[:id])
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
      params.require(:card).permit(:card_number, :card_type, :expiration_month, :expiration_year)
  end  

end
