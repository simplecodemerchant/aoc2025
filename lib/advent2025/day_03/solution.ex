defmodule Advent2025.Day03.Solution do
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, &process_p1/2)
  end

  def process_p1(battery, total) do
    init_first_high = String.to_integer(String.at(battery, 0))

    %{:index => first_high_index} =
      find_highest_num(
        %{index: 0, value: init_first_high},
        1,
        String.length(battery) - 2,
        battery
      )

    init_last_high = String.to_integer(String.at(battery, first_high_index + 1))

    %{:index => last_high_index} =
      find_highest_num(
        %{index: first_high_index + 1, value: init_last_high},
        first_high_index + 1,
        String.length(battery) - 1,
        battery
      )

    total +
      String.to_integer(
        "#{String.at(battery, first_high_index)}#{String.at(battery, last_high_index)}"
      )
  end

  def find_highest_num(%{:value => highest_value} = high, current_index, max_index, battery) do
    val =
      battery
      |> String.at(current_index)
      |> String.to_integer()

    if current_index == max_index do
      if val > highest_value do
        %{index: current_index}
      else
        %{index: high[:index]}
      end
    else
      if val > highest_value do
        find_highest_num(
          %{value: val, index: current_index},
          current_index + 1,
          max_index,
          battery
        )
      else
        find_highest_num(
          high,
          current_index + 1,
          max_index,
          battery
        )
      end
    end
  end

  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, &process_p2/2)
  end

  def process_p2(battery, total) do
    %{:value => value} =
      Enum.reduce(12..1//-1, %{value: "", previous_index: -1}, fn last_allowed_index, data ->
        %{:index => high_index} =
          find_highest_num_2(
            %{index: 0, value: 0},
            data[:previous_index] + 1,
            String.length(battery) - last_allowed_index,
            battery
          )

        data
        |> Map.put(:value, data[:value] <> String.at(battery, high_index))
        |> Map.put(:previous_index, high_index)
      end)

    String.to_integer(value) + total
  end

  def find_highest_num_2(%{:value => highest_value} = high, current_index, max_index, battery) do
    val =
      battery
      |> String.at(current_index)
      |> String.to_integer()

    if current_index == max_index do
      if val > highest_value do
        %{index: current_index}
      else
        %{index: high[:index]}
      end
    else
      if val > highest_value do
        find_highest_num(
          %{value: val, index: current_index},
          current_index + 1,
          max_index,
          battery
        )
      else
        find_highest_num(
          high,
          current_index + 1,
          max_index,
          battery
        )
      end
    end
  end
end
