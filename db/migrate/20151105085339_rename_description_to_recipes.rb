class RenameDescriptionToRecipes < ActiveRecord::Migration
  def change
     rename_column :recipes, :decription, :description
  end
end
