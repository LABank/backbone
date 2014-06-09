require 'spec_helper.rb'

describe TransfersController do
    it "routes to #new" do
      get("/transfers/new").should route_to("transfers#new")
    end
    it "routes to #create" do
      post("/transfers").should route_to("transfers#create")
    end
end
