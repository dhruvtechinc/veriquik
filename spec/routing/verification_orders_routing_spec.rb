require "spec_helper"

describe VerificationOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/verification_orders").should route_to("verification_orders#index")
    end

    it "routes to #new" do
      get("/verification_orders/new").should route_to("verification_orders#new")
    end

    it "routes to #show" do
      get("/verification_orders/1").should route_to("verification_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/verification_orders/1/edit").should route_to("verification_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/verification_orders").should route_to("verification_orders#create")
    end

    it "routes to #update" do
      put("/verification_orders/1").should route_to("verification_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/verification_orders/1").should route_to("verification_orders#destroy", :id => "1")
    end

  end
end
