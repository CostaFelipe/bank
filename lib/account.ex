defmodule Bank.Account do

  defstruct user: User, balance: 1000

  def new(user), do: %__MODULE__{user: user}

  def transferring(accounts, send, to, value) do
    send = Enum.find(accounts, fn account -> account.user.email == send.user.email end)

    cond do
      valid_balance(send.balance, value) -> {:error, "insufficient balance"}
      true ->
        to = Enum.find(accounts, fn account -> account.user.email == to.user.email end)
        send = %Bank.Account{ send | balance: send.balance - value}
      [to, send]
    end
  end

  def withdraw(account, value) do
    cond do
      valid_balance(account.balance, value) -> {:error, "insufficient balance"}
      true ->
        account = %Bank.Account{account | balance: account.balance - value}
        {:ok, account, "message send email"}
    end
  end

  defp valid_balance(balance, value), do: balance < value

end
