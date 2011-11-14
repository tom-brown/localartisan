class HomeController < ApplicationController
  
  def index
    @User = User.new
    @items = Item.all
  end

end
