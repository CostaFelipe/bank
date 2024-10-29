defmodule AccountTest do
  use ExUnit.Case

  test "Given name, email, when insert, then return a new user list" do
    users = []
    users = Account.insert(users, "Jhon doe", "jon@doe.com")
    users = Account.insert(users, "Ada", "ada@ada.com")
    assert length(users) == 2
  end

end
