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
end
