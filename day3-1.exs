defmodule AOC.Day do
    def solve(input) do
        Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, input)
        |> Enum.map(fn [_, first, second] -> String.to_integer(first) * String.to_integer(second) end)
        |> Enum.sum
    end
end

AOC.solve 3