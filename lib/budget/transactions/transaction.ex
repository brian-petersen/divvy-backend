defmodule Budget.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  alias Budget.Transactions.Category

  schema "transactions" do
    field :amount, :decimal
    field :date, :date
    field :description, :string

    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :date, :description, :category_id])
    |> validate_required([:amount, :date, :description])
  end
end
