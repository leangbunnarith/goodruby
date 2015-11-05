class Chef < ActiveRecord::Base
    has_many:recipes
  validates:chefname,presence:true
  validates:email,presence:true
end