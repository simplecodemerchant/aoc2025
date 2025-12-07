defmodule Advent2025.Day02.Solution do
  def part1(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.reduce(0, &process_p1/2)
  end

  defp process_p1(range, total) do
    num_range = get_range(range)
    invalids_total = get_invalids(num_range)
    total + invalids_total
  end

  defp get_range(range) do
    case String.split(range, "-") do
      [start, stop] -> {String.to_integer(start), String.to_integer(stop) + 1}
      _ -> {0, 0}
    end
  end

  defp get_invalids({start, stop}) do
    Enum.reduce(start..stop, 0, fn num, acc ->
      str_num = to_string(num)
      {a, b} = String.split_at(str_num, div(String.length(str_num), 2))
      if a == b, do: num + acc, else: acc
    end)
  end

  def part2(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.reduce(0, &process_p2/2)
  end

  defp process_p2(range, total) do
    num_range = get_range(range)
    invalids_total = get_invalids_p2(num_range)
    total + invalids_total
  end

  def get_invalids_p2({start, stop}) do
    Enum.reduce(start..stop, 0, fn num, acc ->
      str_num = to_string(num)
      str_len = String.length(str_num)
      half = Integer.floor_div(str_len, 2)

      if check_sub_str(half, str_len, str_num) do
        acc + num
      else
        acc
      end
    end)
  end

  def check_sub_str(0, _, _), do: false

  def check_sub_str(step, length, str_num) do
    str_slice = String.slice(str_num, 0..(step - 1))
    str_test = String.duplicate(str_slice, div(length, step))

    if str_test == str_num do
      true
    else
      check_sub_str(step - 1, length, str_num)
    end
  end
end
