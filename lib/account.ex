defmodule Bank.Account do

  defstruct user: User, balance: 1000
  @contas "account.txt"

  def new(user) do
    case  search_accounts_email(user.email) do
      nil ->
      binary = [%__MODULE__{user: user}]  ++ search_accounts()
      |> :erlang.term_to_binary()
      File.write(@contas, binary)
      _ -> {:error, "account registered!"}
    end
  end

  def search_accounts do
      {:ok, binary} = File.read(@contas)
      :erlang.binary_to_term(binary)
  end

  def search_accounts_email(email), do: Enum.find(search_accounts(), &(&1.user.email == email))

  def transferring(send, to, value) do
    send = search_accounts_email(send.user.email)

    cond do
      valid_balance(send.balance, value) -> {:error, "insufficient balance"}
      true ->
        search_accounts()
      #   to =  search_accounts_email(to.user.email)
      #   send = %Bank.Account{ send | balance: send.balance - value}
      # [to, send]
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
