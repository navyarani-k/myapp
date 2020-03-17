require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'valid signup information' do 
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params: {user: { name:"Example user",
      	email: "user@Example.com", password: "password", password_confirmation: "password"}} 	
    end
    follow_redirect!
    assert_template 'users/show'
    # assert_select 'div#error_explanation'
    # assert_select 'div.field_with_errors'
    # assert_select "li", "Name can't be blank"
    # assert_select "li", "Email is invalid"
    # assert_select "li", "Password confirmation doesn't match Password"
  end
end
   