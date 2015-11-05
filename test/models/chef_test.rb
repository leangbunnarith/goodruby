require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef=Chef.new(chefname:"jon",email:"jon@.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname=" "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname=" "
    assert_not @chef.valid?
  end
  
  test "chefname should not be too should" do
    @chef.chefname="aa"
    assert_not @chef.valid?
  end
  
  test "email shoule be prensent" do
    @chef.email=" "
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email= "a" * 101 + "Hello@gmail.com"
    assert_not @chef.valid?
  end
  
  test "email addredd should be unique" do
    dup_chef=@chef.dup
    dup_chef.email=@chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should acept valid address" do
    valid_addresses= %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @chef.email=va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invaliaddresses" do
    invalid_addresses= %w[user@example, com user_at_eee.org user.name.@example. eee@i_am.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email=ia
      assert_not @chef.valid?, '#{ia.inspect} should beinvalid'
    end

  end
  
end