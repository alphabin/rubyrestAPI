require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #signin" do
    it "returns http success" do
      get :signin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #visit" do
    it "returns http success" do
      get :visit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #goodbye" do
    it "returns http success" do
      get :goodbye
      expect(response).to have_http_status(:success)
    end
  end

end
