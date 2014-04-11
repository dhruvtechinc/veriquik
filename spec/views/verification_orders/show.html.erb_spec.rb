require 'spec_helper'

describe "verification_orders/show" do
  before(:each) do
    @verification_order = assign(:verification_order, stub_model(VerificationOrder,
      :users_id => 1,
      :customers_id => 2,
      :status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
