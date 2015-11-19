class CardsController < ApplicationController
  def new
  	@card = Card.new
  end
  
  def create 
    @card = Card.new(card_params)

    if session[:session_user_id]
	    respond_to do |format|
	      if @card.save
	      	# Assign the Card a User 
	      	@user = User.find(session[:session_user_id])
	      	@user.addCard(@card)

	        format.html { redirect_to @card, notice: 'Card was successfully added.' }
	        format.json { render :show, status: :created, location: @card }
	      else
	        format.html { render :new }
	        format.json { render json: @card.errors, status: :unprocessable_entity }
	      end
	    end
  	end
  end

  def index 
    if session[:session_user_id] != 10
      head :forbidden
    else
      @cards = Card.all
    end
  end 

  def show
  	@card = Card.find(params[:id])
  end

  # Show form to share the card with another user
  def share
    @card = Card.find(params[:id])
  end

  # Process form to share a card with another user
  def processShare
    if session[:session_user_id]
      @card = Card.find(params[:id])
      given_email = params[:email]

      # Look up to make sure there is a user with that email
      @shareUser = User.find_by_email(given_email)

      # Add the given card to that user as a shared card
      if (@shareUser)
        @shareUser.addSharedCard(@card)
        flash[:notice] = "The card has been shared with #{given_email}."
      else
        # Error. The user doesn't exist.
        flash[:alert] = "The card has not been shared. There is no user with the given email address."
      end

      redirect_to :controller =>'users', :action => 'show', :id => session[:session_user_id]
    end
  end

  def destroy   
    card = Card.find(params[:id])
    card.cards_users.destroy_all

    if card.destroy     
      flash[:notice] = "Your card has been deleted successfully."   
    else     
      flash[:alert] = "There was a problem deleting the card."   
    end   
    redirect_to :back
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
      params.require(:card).permit(:card_number, :card_type, :expiration_month, :expiration_year)
  end  

end
