defmodule UserTest do
  use ExUnit.Case

  test "Given name, email, when new, then return a user" do
    user = User.new("Jhon doe", "jon@doe.com")
    assert user.name == "Jhon doe"
    assert user.email == "jon@doe.com"
  end

end
