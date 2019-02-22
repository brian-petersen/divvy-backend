defmodule BudgetWeb.TransactionView do
  use BudgetWeb, :view
  alias BudgetWeb.TransactionView

  def render("index.json", %{transactions: transactions}) do
    %{data: render_many(transactions, TransactionView, "transaction.json")}
  end

  def render("show.json", %{transaction: transaction}) do
    %{data: render_one(transaction, TransactionView, "transaction.json")}
  end

  def render("transaction.json", %{transaction: transaction}) do
    %{id: transaction.id,
      amount: transaction.amount,
      date: transaction.date,
      description: transaction.description,
      category_id: transaction.category_id}
  end
end
