class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?
  helper_method :current_user
  helper_method :require_seller
  helper_method :admin? #helper_methond allows views to access methods, if it doesn't have helper:method assigned then only controllers can utilize
  
  def require_sign_in
      redirect_to root_path, :notice=>"Please sign in to use this feature!" unless logged_in?
  end
  
  def require_new_user
    if logged_in?
      redirect_to user_url(session[:user_id]), :notice=>"You're already signed up!"
    else
      return
    end
  end
  
  def admin?
    logged_in? && current_user.admin?
  end
  
  def require_admin
    redirect_to root_url, :notice => "You have to be an administrator for this feature." unless admin?
  end
  
  def logged_in?
    session[:user_id]
  end
  
  def current_user
    @user = User.find(session[:user_id])
  end
  
  def require_seller
    user = User.find_by_id(session[:user_id])
    redirect_to user_url(current_user), :notice => "You must be a seller to list an item. Please update your settings in your Edit Account page." unless user.seller
  end
end
