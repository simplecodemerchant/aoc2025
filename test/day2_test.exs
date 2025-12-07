defmodule Day2Test do
  use ExUnit.Case
  import Advent2025.Day02.Solution

  test "day2 part 2 check_sub_str" do
    assert check_sub_str(2, 4, "1212") == true
    assert check_sub_str(2, 4, "1234") == false
    assert check_sub_str(4, 9, "123123123") == true
  end
end
