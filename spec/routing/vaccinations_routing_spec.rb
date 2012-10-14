require "spec_helper"

describe VaccinationsController do
  describe "routing" do

    it "routes to #index" do
      get("/vaccinations").should route_to("vaccinations#index")
    end

    it "routes to #new" do
      get("/vaccinations/new").should route_to("vaccinations#new")
    end

    it "routes to #show" do
      get("/vaccinations/1").should route_to("vaccinations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vaccinations/1/edit").should route_to("vaccinations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vaccinations").should route_to("vaccinations#create")
    end

    it "routes to #update" do
      put("/vaccinations/1").should route_to("vaccinations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vaccinations/1").should route_to("vaccinations#destroy", :id => "1")
    end

  end
end
