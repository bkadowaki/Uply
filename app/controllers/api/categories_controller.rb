class Api::CategoriesController < ApplicationController
  require 'redis'
  require 'json'
  include RedisStore
  before_action :set_redis
  
  def index
    categories = JSON.parse(get('categories')) 
    
    respond_to do |format|
      format.json { render :json => categories }
    end 
  end
  
  def show
    id = params[:id].to_i
    categories = JSON.parse(get('categories'))
    response = { 'name' => categories[id] }
    
    respond_to do |format|
      format.json { render :json => response }
    end   
  end
  
  private
    
  def set_redis
    set("categories", Category.all.to_json)   
    set("category_ids", Category.all.map(&:id).to_json)
  end
end
