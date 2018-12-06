defmodule Day1 do
  def list_to_numbers(list) do
    Enum.map(list, fn x -> String.to_integer(x) end)
  end

  def change_the_frequency(list) do
    list
    |> list_to_numbers
    |> Enum.sum()
  end

  def solution_part_1(file) do
    file
    |> DataManipulation.file_to_list()
    |> change_the_frequency
  end

  def first_repeated_frequency(input_list) do
    input_list
    |> list_to_numbers
    |> Stream.cycle()
    |> something
  end

def something(input_stream) do
  Enum.reduce_while(input_stream, {0, MapSet.new([0])}, fn item, {number, thing } -> 
    new_freq = item + number
    case MapSet.member?(thing, new_freq) do
      true -> {:halt, new_freq}
      false -> {:cont, {new_freq, MapSet.put(thing, new_freq)}}
    end
  end
    )
end

  def solution_part_2(file) do
    file
    |> DataManipulation.file_to_list()
    |> first_repeated_frequency
  end
end
