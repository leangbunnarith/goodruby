class Chef < ActiveRecord::Base
    has_many:recipes
    has_many:likes
  validates:chefname,presence:true
  validates:email,presence:true
  has_secure_password
end