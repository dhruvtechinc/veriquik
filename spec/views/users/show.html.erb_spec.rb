require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :username => "Username",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :password_digest => "Password Digest",
      :remember_token => "Remember Token",
      :password_reset_token => "Password Reset Token",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
    rendered.should match(/Remember Token/)
    rendered.should match(/Password Reset Token/)
    rendered.should match(/Role/)
  end
end
