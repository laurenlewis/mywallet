class UsersController < ApplicationController
  def index
  	@users = User.all
  	@card = Card.all
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create 
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@user = User.find(params[:id])
    @ownedCards = @user.ownedCards
    @sharedCards = @user.sharedCards

    # Get Total Balance of all Owned Cards
    @total_balance = 0 # initialize sum
    @ownedCards.each do |card|
      @total_balance = @total_balance + card.balance
    end
  end 

  def destroy   
    @user = User.find(params[:id])   
    if @user.destroy     
      session.destroy
      flash[:notice] = "Your account has been deleted successfully."   
    else     
      flash[:alert] = "There was a problem deleting the user."   
    end   
    redirect_to :back
	end
    
  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :phone)
    end
end
