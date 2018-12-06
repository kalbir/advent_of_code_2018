defmodule Day1Test do
  use ExUnit.Case

  test "Change the frequency" do
    assert Day1.change_the_frequency(["+1", "+1", "+1"]) == 3
    assert Day1.change_the_frequency(["+1", "+1", "-2"]) == 0
    assert Day1.change_the_frequency(["-1", "-2", "-3"]) == -6
    assert Day1.change_the_frequency(["+1", "-2", "+3", "+1"]) == 3
  end

  test "First repeated frequence" do
    assert Day1.first_repeated_frequency(["+1", "-1"]) == 0
    assert Day1.first_repeated_frequency(["+3", "+3", "+4", "-2", "-4"]) == 10
    assert Day1.first_repeated_frequency(["-6", "+3", "+8", "+5", "-6"]) == 5
    assert Day1.first_repeated_frequency(["+7", "+7", "-2", "-7", "-4"]) == 14
  end
end
