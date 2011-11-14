class SessionsController < ActionController::Base
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    #raise params[:password].inspect
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Thank you for logging in!"
    else
      flash[:notice] = "Try again to log in."
      redirect_to root_path
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => "You're logged off!"
  end
  
end
