defmodule BudgetWeb.Router do
  use BudgetWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BudgetWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/transactions", TransactionController, except: [:new, :edit]
  end
end
