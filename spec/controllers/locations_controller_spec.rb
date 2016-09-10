RSpec.describe LocationsController, type: :controller do
    # before do
    #   request.env["HTTP_REFERER"] = "testurl"
    # end

  it "sets locations and students" do
    get :index
    expect(response).to have_http_status(:ok)
  end
end
