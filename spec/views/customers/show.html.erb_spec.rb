require 'spec_helper'

describe "customers/show" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :encrypted_ssn => "Encrypted Ssn",
      :address => "Address",
      :city => "City",
      :zip => "Zip",
      :drivers_license_image => "Drivers License Image",
      :current_image => "Current Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Middle Name/)
    rendered.should match(/Encrypted Ssn/)
    rendered.should match(/Address/)
    rendered.should match(/City/)
    rendered.should match(/Zip/)
    rendered.should match(/Drivers License Image/)
    rendered.should match(/Current Image/)
  end
end
