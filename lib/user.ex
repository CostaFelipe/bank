defmodule User do

  defstruct name: nil, email: nil, balance: 1000

  def new(name, email) do
    %__MODULE__{
      name: name,
      email: email
    }
  end
end
