require 'rails_helper'
RSpec.describe LocationsController, type: :controller do
  it "sets locations and students" do
    get :index
    expect(response).to have_http_status(:ok)
  end
end
