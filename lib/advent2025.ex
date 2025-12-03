defmodule Advent2025 do
  def run(day) do
    day_str = Integer.to_string(day) |> String.pad_leading(2, "0")
    solution_module = "Elixir.Advent2025.Day" <> day_str <> ".Solution" |> String.to_atom()
    input_path = "lib/advent2025/day_#{day_str}/input.txt"

    input = File.read!(input_path)

    IO.puts("Day #{day_str} - Part 1: #{solution_module.part1(input)}")
    IO.puts("Day #{day_str} - Part 2: #{solution_module.part2(input)}")
  end
end
