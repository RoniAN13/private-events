class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.all
    end
    def new
        @category = Category.new
    end
    def create
    @category= current_user.categories.build(category_params)
   
     if @category.save 
       redirect_to categories_path
      
     else 
      render 'new'
     end
  end 
    def destroy
    end
   def show
    @category = Category.find(params[:id])
    @events = @category.events
   end 
private
def category_params
    params.require(:category).permit(:name)
  end

end
