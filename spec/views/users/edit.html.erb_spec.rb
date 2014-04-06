require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :remember_token => "MyString",
      :password_reset_token => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_last_name[name=?]", "user[last_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
      assert_select "input#user_remember_token[name=?]", "user[remember_token]"
      assert_select "input#user_password_reset_token[name=?]", "user[password_reset_token]"
      assert_select "input#user_role[name=?]", "user[role]"
    end
  end
end
