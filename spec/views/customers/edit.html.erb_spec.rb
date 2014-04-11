require 'spec_helper'

describe "customers/edit" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :encrypted_ssn => "MyString",
      :address => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :drivers_license_image => "MyString",
      :current_image => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do
      assert_select "input#customer_first_name[name=?]", "customer[first_name]"
      assert_select "input#customer_last_name[name=?]", "customer[last_name]"
      assert_select "input#customer_middle_name[name=?]", "customer[middle_name]"
      assert_select "input#customer_encrypted_ssn[name=?]", "customer[encrypted_ssn]"
      assert_select "input#customer_address[name=?]", "customer[address]"
      assert_select "input#customer_city[name=?]", "customer[city]"
      assert_select "input#customer_zip[name=?]", "customer[zip]"
      assert_select "input#customer_drivers_license_image[name=?]", "customer[drivers_license_image]"
      assert_select "input#customer_current_image[name=?]", "customer[current_image]"
    end
  end
end
