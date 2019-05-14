defmodule PhoenixDemoWeb.Components.Button do
  use Phoenix.LiveView

  def render(label: label, alternative: alternative, height: height, width: width = assigns) do
    ~L"""
      <section
        class="PhoenixDemoWeb Components Button <%= if alternative, do: "alternative", else: "primary" %>"
        style="grid-row: span <%= height %>; grid-column: span <%= width %>"
        phx-click="update"
        phx-value=<%= label %>
      >
        <div><%= label %></div>
      </section>
    """
  end
end
