class Recipe < ActiveRecord::Base
  
  #table chef
  belongs_to:chef
  #table like
  has_many:likes
  #table recipestyle and style
  has_many:recipe_styles
  has_many:styles, through: :recipe_styles
  # table recipe_ingredient and ingredient
  has_many:recipe_ingredients
  has_many:ingredients, through: :recipe_ingredients
  validates:chef_id,presence:true
  validates:name,presence:true
  validates:summary,presence:true
  validates:description,presence:true
  mount_uploader :picture,PictureUploader
  validate:picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture,"should be less than 5MB")
      end
  
    end
  
end