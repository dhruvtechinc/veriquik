require 'spec_helper'

describe "customers/index" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :encrypted_ssn => "Encrypted Ssn",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :drivers_license_image => "Drivers License Image",
        :current_image => "Current Image"
      ),
      stub_model(Customer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :encrypted_ssn => "Encrypted Ssn",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :drivers_license_image => "Drivers License Image",
        :current_image => "Current Image"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Ssn".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Drivers License Image".to_s, :count => 2
    assert_select "tr>td", :text => "Current Image".to_s, :count => 2
  end
end
