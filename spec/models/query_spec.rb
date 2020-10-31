require 'rails_helper'

RSpec.describe Query, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should be initialized with a hash of properties" do
    properties = { name: "John", email: "john@gmail.com", message: "hello" }
    query = Query.new(properties)
    expect(query).to be_a(Query)
  end

  context 'validation tests' do
    it 'ensures the name has been provided' do
      properties = {email: "john@gmail.com", message: "hello" }
      query = Query.new(properties).save
      expect(query).to eq(false)
    end

    it 'should a reject a name made up only of invalid characters' do
      properties = {name: "%$£", email: "john@gmail.com", message: "hello" }
      query = Query.new(properties).save
      expect(query).to eq(false)
    end

    it 'when rejecting a name due to format, it should provide an error message description' do
      properties = {name: "%$£", email: "john@gmail.com", message: "hello" }
      query = Query.new(properties)
      query.save
      expect(query.errors.messages[:name][0]).to eq("only allows letters from the alphabet a-z and spaces")
    end


  end

end
