class RecipesController <ApplicationController
  before_action :set_recipe, only:[:edit, :update, :show]
  before_action :require_user,except:[:show, :index]
  before_action :require_same_user, only:[:edit, :update]
  
  def index
   @recipes = Recipe.paginate(page: params[:page], per_page: 10)
  end
  
  def show
  
  end
  
  def new
    @recipe=Recipe.new
  end
  
  def edit
     
  end
  
  def update
      
        if @recipe.update(recipe_params)
           #do something
           flash[:success] = "Your Recipe was Update Successfully!"
          redirect_to recipe_path(@recipe)
        end
          
  end
  
  def like
     
  
    like=Like.create(like: params[:like], chef: current_user, recipe: @recipe)
    if like.valid?
        flash[:success] = "your selection was auccess"
        redirect_to :back
    else
        flash[:danger] = "you can only like/dislike a recipe once"
        redirect_to :back
    end  
  end
  
  def delete
       @recipe=Recipe.find(params[:id])
        if @recipe.delete(recipe_params)
           #do something
           flash[:success] = "Your Recipe was delete Successfully!"
          redirect_to recipe_path(@recipe)
        
    
        end
          
  end
  
  def create
     @recipe=Recipe.new(recipe_params)
     @recipe.chef= current_user
     
     if @recipe.save
         flash[:success]="Your recipe was create successfully"
         redirect_to recipes_path
     else
         render :new
     end
  end
  
  
  
  private
  
    def recipe_params
        params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
  def set_recipe
       @recipe = Recipe.find(params[:id]) 
  end
  def require_same_user
     if current_user != @recipe.chef 
         flash[:danger] = "you can only edit your own recipes"
         redirect_to recipes_path
     end
  end
end