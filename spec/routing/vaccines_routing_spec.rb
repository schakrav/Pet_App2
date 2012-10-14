require "spec_helper"

describe VaccinesController do
  describe "routing" do

    it "routes to #index" do
      get("/vaccines").should route_to("vaccines#index")
    end

    it "routes to #new" do
      get("/vaccines/new").should route_to("vaccines#new")
    end

    it "routes to #show" do
      get("/vaccines/1").should route_to("vaccines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vaccines/1/edit").should route_to("vaccines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vaccines").should route_to("vaccines#create")
    end

    it "routes to #update" do
      put("/vaccines/1").should route_to("vaccines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vaccines/1").should route_to("vaccines#destroy", :id => "1")
    end

  end
end
