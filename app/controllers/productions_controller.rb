class ProductionsController < ApplicationController


  def index
    @productions = Production.includes(:images).order('created_at DESC')
  end

  def show
    @production = Production.find(params[:id])
  end

  def new
    @production = Production.new
    @production.images.new
    @category = Category.where(ancestry: "")
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
    end
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
    end

  def create
    
    @production = Production.new(production_params)
    if @production.save!
      redirect_to root_path(@production.user_id)
    else
      render :new
    end

  end

  def update
  end

  private

  def production_params
    params.require(:production).permit(
      :category_id,
      :name,
      :price,
      :introduction,
      :size,
      :shipping_charge,
      :prefecture_code,
      :detail_date,
      :trading_status,
      images_attributes: [:src])
      .merge(user_id: current_user.id)
      
  end


end



