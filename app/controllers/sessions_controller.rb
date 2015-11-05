class SessionsController < ApplicationController
# defining actions for sessions_controller
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.password == params[:session][:password]
      # Log the user in and redirect to the user's show page.
      flash[:notice] = "Successful Login!"
	  session[:session_user_id] = user.id
	  session[:session_user_email] = user.email
	  redirect_to :controller =>'users', :action => 'show', :id => user.id
    else  
      flash[:alert] = "Email or password is incorrect!"
      render 'new'
  	end
  end	

  def destroy
    session.destroy
    flash[:notice] = "You are signed out"
    redirect_to root_path
end
end
