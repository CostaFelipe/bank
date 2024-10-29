defmodule AccountTest do
  use ExUnit.Case

  describe "insert/3" do
    test "Given name, email, when insert, then return a new user list" do
      users = []
      users = Account.insert(users, "Jhon doe", "jon@doe.com")
      users = Account.insert(users, "Ada", "ada@ada.com")
      assert length(users) == 2
    end

    test "Give a user that already exist, when insert, then return the same user list" do
      users = []
      users = users |> Account.insert("Jhon doe", "jon@doe.com") |> Account.insert("Jhon doe", "jon@doe.com")
      assert length(users) == 1
    end
  end
end
