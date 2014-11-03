require "rails_helper"

describe UsersController do
  describe "routing" do
    it "routes to users#show" do
      expect(get("/dashboard")).to route_to("users#show")
    end
  end
end
