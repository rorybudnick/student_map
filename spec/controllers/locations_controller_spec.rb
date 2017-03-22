require 'rails_helper'
RSpec.describe LocationsController, type: :controller do
  describe "#index" do
    it "sets locations and students" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do
    it "creates a new location" do
      params = {
        name: "Salvation Army",
        street: "123 Main St.",
        city: "Los Angeles",
        state: "CA",
        zip_code: "90210",
        notes: "Just opened"
      }
      get :create, params
      expect(response).to have_http_status(:created)
    end
  end
end
