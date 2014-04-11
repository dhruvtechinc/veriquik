require 'spec_helper'

describe "verification_orders/index" do
  before(:each) do
    assign(:verification_orders, [
      stub_model(VerificationOrder,
        :users_id => 1,
        :customers_id => 2,
        :status => 3
      ),
      stub_model(VerificationOrder,
        :users_id => 1,
        :customers_id => 2,
        :status => 3
      )
    ])
  end

  it "renders a list of verification_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
