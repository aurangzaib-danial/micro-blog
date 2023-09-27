require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#name" do
    it "cannot contain invalid characters" do
      user = User.new(name: "john#carter", email: "john@j.com", password: "123456")
      expect(user).not_to be_valid
    end

    it "valid with proper input" do
      user = User.new(name: "john carter", email: "john@j.com", password: "123456")
      expect(user).to be_valid
    end

    it "whitespace is stripped out after validation" do
      user = User.new(name: "   john", email: "john@j.com", password: "123456")
      user.valid?
      expect(user.name).to eq("john")
    end
  end
end
