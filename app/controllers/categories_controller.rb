class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]



  # GET /categories/1
  # GET /categories/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :hidden, :sort, :seo_name, :image, :parent_id)
    end
end
