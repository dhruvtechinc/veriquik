require 'spec_helper'

describe "verification_orders/new" do
  before(:each) do
    assign(:verification_order, stub_model(VerificationOrder,
      :users_id => 1,
      :customers_id => 1,
      :status => 1
    ).as_new_record)
  end

  it "renders new verification_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", verification_orders_path, "post" do
      assert_select "input#verification_order_users_id[name=?]", "verification_order[users_id]"
      assert_select "input#verification_order_customers_id[name=?]", "verification_order[customers_id]"
      assert_select "input#verification_order_status[name=?]", "verification_order[status]"
    end
  end
end
