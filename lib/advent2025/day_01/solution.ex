defmodule Advent2025.Day01.Solution do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({50, 0}, fn line, {pos, zeros} ->
      new_pos = calculate_new_position_p1(line, pos)
      new_zeros = if new_pos == 0, do: zeros + 1, else: zeros
      {new_pos, new_zeros}
    end)
    |> elem(1)
  end

  defp calculate_new_position_p1(line, pos) do
    case String.split_at(line, 1) do
      {"R", v} -> Integer.mod(pos + String.to_integer(v), 100)
      {"L", v} -> Integer.mod(pos - String.to_integer(v), 100)
    end
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce({50, 0}, &process_rotation_p2/2)
    |> elem(1)
  end

  defp process_rotation_p2(line, {position, total_zeros}) do
    {direction, distance} = parse_line_p2(line)
    zeros_in_move = count_zeros_p2(direction, distance, position)
    new_position = calculate_new_position_p2(direction, distance, position)
    {new_position, total_zeros + zeros_in_move}
  end

  defp parse_line_p2(line) do
    case String.split_at(line, 1) do
      {"L", v} -> {:left, String.to_integer(v)}
      {"R", v} -> {:right, String.to_integer(v)}
    end
  end

  defp count_zeros_p2(:left, distance, 0), do: div(distance, 100)

  defp count_zeros_p2(:left, distance, position) when distance >= position do
    div(distance - position, 100) + 1
  end

  defp count_zeros_p2(:right, distance, position) do
    div(distance + position, 100)
  end

  defp count_zeros_p2(_, _, _), do: 0

  defp calculate_new_position_p2(:left, distance, position) do
    Integer.mod(position - distance, 100)
  end

  defp calculate_new_position_p2(:right, distance, position) do
    Integer.mod(position + distance, 100)
  end
end
