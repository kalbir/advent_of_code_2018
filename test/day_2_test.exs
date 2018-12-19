defmodule Day2Test do
  use ExUnit.Case

  test "Find the total" do
    assert Day2.solution_part_1("test/day_2_data") == 12
  end

  test "Find the letter" do
    assert Day2.solution_part_2("test/day_2_2_data") == "fgij"
  end
end
