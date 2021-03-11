require 'rails_helper'

RSpec.describe User, type: :model do
  it " find users with foo settings set to true with SQL query" do
    u1 = User.new
    u1.foo = true
    u1.save

    u2 = User.new
    u2.save

    u3 = User.new
    u3.foo = true
    u3.save

    expect(User.where('("settings"->>\'foo\')::boolean IS TRUE').size).to eq(2)
  end
end
