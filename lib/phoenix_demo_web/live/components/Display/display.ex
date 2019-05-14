defmodule PhoenixDemoWeb.Components.Display do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <section class="PhoenixDemoWeb Components Display">
        <div class="display"><%= if @state.right != 0, do: @state.right, else: @state.left %></div>
      </section>
    """
  end
end
