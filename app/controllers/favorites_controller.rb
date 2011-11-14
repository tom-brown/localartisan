class FavoritesController < ApplicationController

before_filter :logged_in?
before_filter :require_sign_in, :only => [:edit, :show, :create, :update, :destroy, :new]

  def index
    @user = current_user
    @favorites = @user.favorites.all
  end

  # def new
  #    @favorite = Favorite.new
  #    @user = current_user
  #    @item = Item.first
  #  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.item_id = params[:id]
    @favorite.save
    redirect_to item_url(params[:id]), :notice => "Item has been added to Favorites"
  end

  def edit
    user = User.find(session[:user_id])
    if user.favorites.find(params[:id]).present?
      @favorite = user.favorites.find(params[:id])
      return
    else
      redirect_to user_url(session[:user_id]), :notice => "Not your favorite!"
    end
  end
  
  def update
      @favorite = Favorite.find(params[:id])
      @favorite.note = params[:favorite][:note]
      @favorite.save     #THIS CODE HAS NO ERRORS, BUT OUR NOTE IS NOT SAVING!!!!??? WTF????
      redirect_to favorites_url, :notice => "Item has been updated"
  end  

  def destroy
      
  end



end
