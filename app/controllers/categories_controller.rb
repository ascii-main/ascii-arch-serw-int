class CategoriesController < ApplicationController

	load_and_authorize_resource

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])
    @category.save
    respond_with(@category)
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.products.each do |p|
    	@pro = Product.find p.id
    	@pro.destroy
    end
    @category.destroy
    respond_with(@category)
  end
end
