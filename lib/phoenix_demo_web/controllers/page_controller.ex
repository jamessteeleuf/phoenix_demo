defmodule PhoenixDemoWeb.PageController do
  use PhoenixDemoWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, PhoenixDemoWeb.CalculatorView, session: %{})
  end
end
