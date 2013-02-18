require "spec_helper"

describe ProfileCandidatesController do
  describe "routing" do

    it "routes to #index" do
      get("/profile_candidates").should route_to("profile_candidates#index")
    end

    it "routes to #new" do
      get("/profile_candidates/new").should route_to("profile_candidates#new")
    end

    it "routes to #show" do
      get("/profile_candidates/1").should route_to("profile_candidates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/profile_candidates/1/edit").should route_to("profile_candidates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/profile_candidates").should route_to("profile_candidates#create")
    end

    it "routes to #update" do
      put("/profile_candidates/1").should route_to("profile_candidates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/profile_candidates/1").should route_to("profile_candidates#destroy", :id => "1")
    end

  end
end
