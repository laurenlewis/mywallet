class UsersController < ApplicationController
  def index
  	@users = User.all
  	@card = Card.all
  end

  def show
  	@user = User.find(params[:id])
  end 
end
