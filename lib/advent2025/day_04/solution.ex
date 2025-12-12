defmodule Advent2025.Day04.Solution do
  alias Advent2025.Utils.List, as: Lst
  alias Advent2025.Utils.Str, as: Str

  # Every solution is Enum.reduce when I'm in charge
  def part1(input) do
    lines =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.graphemes()
      end)

    lines
    |> Enum.with_index()
    |> Enum.reduce(0, fn {line, line_index}, total ->
      prev_line = Lst.strict_at(lines, line_index - 1, nil)
      next_line = Lst.strict_at(lines, line_index + 1, nil)

      valid =
        line
        |> Enum.with_index(fn item, i -> {item, i} end)
        |> Enum.reduce(0, fn {char, char_index}, acc ->
          if char != "@" do
            acc
          else
            surrounding =
              (Str.strict_at(prev_line, (char_index - 1)..(char_index + 1), nil) ++
                 [Str.strict_at(line, char_index - 1, nil)] ++
                 [Str.strict_at(line, char_index + 1, nil)] ++
                 Str.strict_at(next_line, (char_index - 1)..(char_index + 1), nil))
              |> Enum.count(fn x -> x == "@" end)

            if surrounding < 4 do
              acc + 1
            else
              acc
            end
          end
        end)

      valid + total
    end)
  end

  def part2(_input) do
    # input
    # |> String.split("\n", trim: true)
    # |> Enum.reduce(0, &process_p2/2)
    :ok
  end
end
