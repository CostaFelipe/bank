defmodule Account do
  defstruct users: []

  def insert(users, name, email) do
    new_user = User.new(name, email)
    [new_user | users]
  end
end
