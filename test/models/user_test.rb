require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do 
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
    	               password:"foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name= "a" * 51
    assert_not @user.valid?
  end

  test "email addresses should be saved as lowercase" do
     mixed_case_email = "Foo@ExAMPLe.COM"
     @user.email = mixed_case_email
     @user.save
     assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (non-blank)" do
    @user.password = @user.password_confirmation = " "* 6
    assert_not @user.valid?
  end
  
  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
