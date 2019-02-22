defmodule Budget.Transactions.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias Budget.Transactions.Transaction

  schema "categories" do
    field :name, :string

    has_many :transactions, Transaction

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
