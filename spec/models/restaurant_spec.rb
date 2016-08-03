require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  let(:restaurant_with_two_parties) do
    bakery = Restaurant.new(name: "Test Bakery", email: "test@test.com", password: "password")
    bakery.parties.new(name: "Party_1", size: 1, cell: "1234567890")
    bakery.parties.new(name: "Party_2", size: 2, cell: "0987654321")
    return bakery
  end

  context "Restaurant has been created in database" do

    it "and has username, email, and password" do
      expect([restaurant_with_two_parties.name, restaurant_with_two_parties.email, restaurant_with_two_parties.password]).to eq(["Test Bakery", "test@test.com", "password"])
    end

    it "and is associated with related parties" do
      parties_array = []
      restaurant_with_two_parties.parties.each do |party|
        parties_array << party.name
      end

      expect(parties_array).to eq (["Party_1", "Party_2"])
    end

    it "and returns nothing if no prize exist" do
      expect(restaurant_with_two_parties.prize).to be_nil
    end

    xit "and is associated with prizes if prizes exist" do
    end
  end
end
