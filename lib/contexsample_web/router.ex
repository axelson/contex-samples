defmodule ContexSampleWeb.Router do
  use ContexSampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ContexSampleWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/faq", PageController, :faq

    live "/barplots", BarPlotLive
    live "/barplot_timer", BarPlotTimer
    live "/sparklines", SparklineLive
    live "/gantt", GanttLive
    live "/point", PointPlotLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", ContexSampleWeb do
  #   pipe_through :api
  # end
end
