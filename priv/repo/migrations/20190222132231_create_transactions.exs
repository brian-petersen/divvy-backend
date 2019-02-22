defmodule Budget.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :decimal
      add :date, :date
      add :description, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:transactions, [:category_id])
  end
end
