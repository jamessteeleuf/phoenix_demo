defmodule PhoenixDemoWeb.CalculatorView do
  require Logger
  use Phoenix.LiveView
  alias PhoenixDemoWeb.Components.Display
  alias PhoenixDemoWeb.Components.Button

  def render(assigns) do
    ~L"""
      <section class="PhoenixDemoWeb CalculatorView">
        <%= Display.render(assigns) %>

        <%= Button.render(label: "AC", alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "+/-", alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "%", alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "÷", alternative: true, height: 1, width: 1) %>

        <%= Button.render(label: 7, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 8, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 9, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "x", alternative: true, height: 1, width: 1) %>

        <%= Button.render(label: 4, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 5, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 6, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "-", alternative: true, height: 1, width: 1) %>

        <%= Button.render(label: 1, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 2, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: 3, alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "+", alternative: true, height: 1, width: 1) %>

        <%= Button.render(label: 0, alternative: false, height: 1, width: 2) %>
        <%= Button.render(label: ".", alternative: false, height: 1, width: 1) %>
        <%= Button.render(label: "=", alternative: true, height: 1, width: 1) %>
      </section>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, state: %PhoenixDemo.Calculator{})}
  end

  def handle_event("update", value, socket) do
    case Integer.parse(value) do
      { number, _ } -> {:noreply, update(socket, :state, fn state ->
        PhoenixDemo.Calculator.update(state, number)
      end)}
      :error -> {:noreply, update(socket, :state, fn state ->
        PhoenixDemo.Calculator.update(state, value)
      end)}
    end
  end
end
