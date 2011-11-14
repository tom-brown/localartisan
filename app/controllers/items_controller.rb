class ItemsController < ApplicationController

  before_filter :require_seller, :only => [:new, :edit]

  # GET /items
  # GET /items.json
  def index
    @items = Item.scoped

    if params[:Category].present?
      @items = @items.where(:category_id => params[:Category])
    end
    
     if params[:price].present?
         @items = @items.where("price <= ?", params[:price])
        # @items = @items.where(":price <= ?", "#{params[:price]}")
        # @items = @items.where(":price <= ?", "%#{params[:price]}%")      
     end
    
    if params[:search].present?
      @items = @items.where(["title LIKE ?", "%#{params[:search]}%"])
    end
    
    if params['Neighborhood'].present?
      users = User.where(:neighborhood_id => params['Neighborhood'])
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
    a=@item.item_images.count
    a.times {@item.item_images.build}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    4.times {@item.item_images.build}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    user = current_user
    @item = Item.find(params[:id])
    img_number_to_show = 4 - @item.item_images.count
    img_number_to_show.times {@item.item_images.build}
  end

  # POST /items
  # POST /items.json
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

  # PUT /items/1
  # PUT /items/1.json
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

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
end
