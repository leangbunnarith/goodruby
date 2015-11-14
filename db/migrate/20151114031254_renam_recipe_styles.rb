class RenamRecipeStyles < ActiveRecord::Migration
  def change
    rename_table :recipe_ingredients, :recipe_styles
  end
end
