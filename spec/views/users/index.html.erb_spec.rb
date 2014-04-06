require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :username => "Username",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_token => "Remember Token",
        :password_reset_token => "Password Reset Token",
        :role => "Role"
      ),
      stub_model(User,
        :username => "Username",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :remember_token => "Remember Token",
        :password_reset_token => "Password Reset Token",
        :role => "Role"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Remember Token".to_s, :count => 2
    assert_select "tr>td", :text => "Password Reset Token".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
