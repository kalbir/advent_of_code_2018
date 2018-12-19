defmodule Day2 do
  def list_to_numbers(list) do
    Enum.map(list, fn x -> String.to_integer(x) end)
  end

  def solution_part_1(file) do
    file
    |> DataManipulation.file_to_list_of_units()
    |> Enum.map(fn x -> String.graphemes(Enum.at(x, 0)) end)
    |> checksum
  end

  def uniques(singles) do
    Enum.map(singles, fn x -> Enum.uniq(x) end)
  end

  def how_many_items(list) do
    unique_list = Enum.uniq(list)

    Enum.reduce(unique_list, {0, 0}, fn x, {acc, bcc} ->
      case Enum.count(list, fn y -> y == x end) do
        2 -> {1, bcc}
        3 -> {acc, 1}
        _ -> {acc, bcc}
      end
    end)
  end

  def multiply({a, b}) do
    a * b
  end

  def checksum(a_list_of_lists) do
    Enum.map(a_list_of_lists, fn x -> how_many_items(x) end)
    |> Enum.reduce({0, 0}, fn x, {a, b} ->
      case x do
        {1, 1} -> {a + 1, b + 1}
        {1, _} -> {a + 1, b}
        {_, 1} -> {a, b + 1}
        {_, _} -> {a, b}
      end
    end)
    |> multiply
  end

  def solution_part_2(file) do
    file
    |> DataManipulation.file_to_list_of_units()
    |> Enum.map(fn x -> {Enum.at(x, 0), String.graphemes(Enum.at(x, 0))} end)
    |> Enum.map(fn {k, x} -> {k, Enum.with_index(x)} end)
    |> Enum.map(fn {k, x} -> {k, MapSet.new(x)} end)
    |> one_letter_difference
    |> List.flatten()
    |> List.delete_at(2)
    |> processing
  end

  def one_letter_difference(list) do
    Enum.map(list, fn {k, x} ->
      Enum.map(list, fn {j, y} -> [{j, k}, MapSet.difference(x, y)] end)
    end)
    |> Enum.map(fn x -> Enum.reject(x, fn [{_, _}, c] -> MapSet.size(c) !== 1 end) end)
    |> Enum.reject(fn x -> x == [] end)
  end

  def processing([{a, _}, c, _]) do
    breakdown = String.graphemes(a)

    [{a,b}] = MapSet.to_list(c)
    
    [position] = Enum.reject([a,b], fn x -> String.valid?(x) end)

    List.delete_at(breakdown, position)
    |> List.to_string
  end

end
