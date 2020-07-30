require "rails_helper"

RSpec.describe TypesReportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/types_reports").to route_to("types_reports#index")
    end

    it "routes to #show" do
      expect(get: "/types_reports/1").to route_to("types_reports#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/types_reports").to route_to("types_reports#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/types_reports/1").to route_to("types_reports#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/types_reports/1").to route_to("types_reports#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/types_reports/1").to route_to("types_reports#destroy", id: "1")
    end
  end
end
