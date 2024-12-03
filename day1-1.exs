defmodule AOC.Day do
    defp parse_line(line) do
        line |> String.split("   ") |> Enum.map(&String.to_integer/1) |> List.to_tuple
    end

    def solve(input) do
        input
        |> String.split("\n")
        |> Enum.map(&parse_line/1)
        |> Enum.unzip
        |> then(fn {a, b} -> {Enum.sort(a), Enum.sort(b)} end)
        |> then(fn {a, b} -> Enum.zip(a, b) end)
        |> Enum.map(fn {a, b} -> abs(a - b) end)
        |> Enum.sum
    end
end

AOC.solve 1