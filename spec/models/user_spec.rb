require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "relationships" do
    it {should have_many :items}
  end

  describe "roles" do
    it "can be created as a default visitor" do
      user = User.create(name: "Timmy",
                         email: "Timmy@gmail.com",
                         role: 0)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end
