class ItemsController < ApplicationController

  before_filter :require_seller, :only => [:new, :edit]

  def index
    @items = Item.scoped

    if params[:category].present?
      @items = @items.where(:category_id => params[:category])
    end
    
     if params[:price].present?
         @items = @items.where("price <= ?", params[:price])     
     end
    
    if params[:search].present?
      @items = @items.where(["title LIKE ?", "%#{params[:search]}%"])
    end
    
    if params[:neighborhood].present?
      users = User.where(:neighborhood_id => params[:neighborhood])
      @items = @items.where(["user_id IN ( ? )", users.map{|u| u.id}])
    end
    
    @items = @items.page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @user = @item.user_id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  def new
    @item = Item.new
    4.times {@item.item_images.build}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @user == @item.user
      img_number_to_show = 4 - @item.item_images.count
      img_number_to_show.times {@item.item_images.build}
    else
      redirect_to item_url(@item), :notice => "Only the seller of this item can edit it."
    end
  end

  def create
    @item = Item.new(params[:item])
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, :notice => 'Item was successfully created.' }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, :notice => 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
end
