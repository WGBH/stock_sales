require 'rails_helper'

describe HomeController do
  
  describe "GET home" do
    it "gets the users" do
      get :home
      expect(assigns(:users)).to_not be nil
    end
  end
end
