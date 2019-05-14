defmodule PhoenixDemo.Calculator do
  defstruct left: 0, right: 0, op: nil

  defp calculate(left, "+", right), do: left + right
  defp calculate(left, "-", right), do: left - right
  defp calculate(left, "÷", right), do: left / right
  defp calculate(left, "x", right), do: left * right

  def update(_state, "AC") do
    %PhoenixDemo.Calculator{}
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: nil }, token) when is_integer(token) do
    %PhoenixDemo.Calculator{
      left: left * 10 + token,
      right: right,
      op: nil
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, token) when is_integer(token) do
    %PhoenixDemo.Calculator{
      left: left,
      right: right * 10 + token,
      op: op
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: _op }, "+") do
    %PhoenixDemo.Calculator{
      left: left,
      right: right,
      op: "+"
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: _op }, "-") do
    %PhoenixDemo.Calculator{
      left: left,
      right: right,
      op: "-"
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: _op }, "÷") do
    %PhoenixDemo.Calculator{
      left: left,
      right: right,
      op: "÷"
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: _op }, "x") do
    %PhoenixDemo.Calculator{
      left: left,
      right: right,
      op: "x"
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, "=") when not is_nil(op) do
    %PhoenixDemo.Calculator{
      left: calculate(left, op, right),
      right: 0,
      op: nil
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, "+/-") when not is_nil(op) do
    %PhoenixDemo.Calculator{
      left: left,
      right: right * -1,
      op: op
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, "+/-") when is_nil(op) do
    %PhoenixDemo.Calculator{
      left: left * -1,
      right: right,
      op: op
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, "%") when not is_nil(op) do
    %PhoenixDemo.Calculator{
      left: left,
      right: right * 0.01,
      op: op
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, "%") when is_nil(op) do
    %PhoenixDemo.Calculator{
      left: left * 0.01,
      right: right,
      op: op
    }
  end

  def update(%PhoenixDemo.Calculator{ left: left, right: right, op: op }, _) do
    %PhoenixDemo.Calculator{ left: left, right: right, op: op }
  end
end
