require 'spec_helper'

describe "verification_orders/edit" do
  before(:each) do
    @verification_order = assign(:verification_order, stub_model(VerificationOrder,
      :users_id => 1,
      :customers_id => 1,
      :status => 1
    ))
  end

  it "renders the edit verification_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", verification_order_path(@verification_order), "post" do
      assert_select "input#verification_order_users_id[name=?]", "verification_order[users_id]"
      assert_select "input#verification_order_customers_id[name=?]", "verification_order[customers_id]"
      assert_select "input#verification_order_status[name=?]", "verification_order[status]"
    end
  end
end
