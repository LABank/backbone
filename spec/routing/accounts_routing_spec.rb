require 'spec_helper.rb'

describe AccountsController do
    it "routes to #index" do
      get("/accounts").should route_to("accounts#index")
    end
end
