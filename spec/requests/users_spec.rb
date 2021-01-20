require 'rails_helper'

user = User.new(
  email: "amama@gmail.com", 
  password: "123456789",
  password_confirmation: "123456789",
  role: "customer"
)

current_user = User.first

user.save

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it "works! (now write some real specs)" do
      get "/users/1"
      expect(response.status).to eq(200)
    end
  end

  describe "POST /users" do
    it "works! (now write some real specs)" do
      post "/signup", params: {
        email: "terr@gmail.com", 
        password: "123456789",
        password_confirmation: "123456789",
        role: "customer"
      }
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /users" do
    it "works! (now write some real specs)" do
      put "/users/1", params: {
        email: "terrik@gmail.com"
      }
      expect(response.status).to eq(200)
    end
  end
end
