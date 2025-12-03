defmodule Advent2025.Day01.Solution do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(%{acc: 50, zeros: 0}, fn v, a ->
      turn_dial(v, a)
      |> inc_zero()
    end)
    |> Map.get(:zeros, 0)
  end

  def turn_dial(val, %{:acc => acc, :zeros => zeros}) do
    case String.split_at(val, 1) do
      {"R", v} -> %{acc: Integer.mod(acc + String.to_integer(v), 100), zeros: zeros}
      {"L", v} -> %{acc: Integer.mod(acc - String.to_integer(v), 100), zeros: zeros}
    end
  end

  def inc_zero(%{:acc => 0 = acc, :zeros => zeros}), do: %{acc: acc, zeros: zeros + 1}
  def inc_zero(val), do: val

  def part2(_input) do
    "todo"
  end
end
