defmodule Account do
  defstruct users: []

  def insert(users, name, email) do
    case Enum.find(users, fn user -> user.email == email end) do
      nil -> [User.new(name, email) | users]
      _ -> users
    end
  end
end
