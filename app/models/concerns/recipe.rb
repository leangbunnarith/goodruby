class Recipe < ActiveRecord::Base
  
  validates:name,presence:true
  validates:summary,presence:true
  validates:description,presence:true
  belongs_to:chef
end