require 'rails_helper'

describe RegistrationsController do
  describe "#update_resource" do
    let(:user) { object_double(User.new, password: "password", email: "email@email.com", update_with_password: true, update_without_password: true) }

    it "calls user.update_with_password when user changes password" do
      expect(user).to receive(:update_with_password)
      controller.update_resource(user, { password: "pa55w0rd", first_name: "User" })
    end

    it "calls user.update_with_password when user changes email" do
      expect(user).to receive(:update_with_password)
      controller.update_resource(user, { email: "test@test.com", first_name: "User" })
    end

    it "calls user.update_without_password when user does not change password or email" do
      expect(user).to receive(:update_without_password)
      controller.update_resource(user, { password: user.password, email: user.email, first_name: "User" })
    end
  end
end
