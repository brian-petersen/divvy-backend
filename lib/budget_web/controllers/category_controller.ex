defmodule BudgetWeb.CategoryController do
  use BudgetWeb, :controller

  alias Budget.Transactions
  alias Budget.Transactions.Category

  action_fallback BudgetWeb.FallbackController

  def index(conn, _params) do
    categories = Transactions.list_categories()
    render(conn, "index.json", categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Transactions.create_category(category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.category_path(conn, :show, category))
      |> render("show.json", category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Transactions.get_category!(id)
    render(conn, "show.json", category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Transactions.get_category!(id)

    with {:ok, %Category{} = category} <- Transactions.update_category(category, category_params) do
      render(conn, "show.json", category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Transactions.get_category!(id)

    with {:ok, %Category{}} <- Transactions.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
