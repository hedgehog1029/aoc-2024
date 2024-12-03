defmodule AOC.Day do
    defp process({list, freqs}) do
        list
        |> Enum.map(fn n -> n * Map.get(freqs, n, 0) end)
        |> Enum.sum
    end

    defp parse_line(line) do
        line |> String.split("   ") |> Enum.map(&String.to_integer/1) |> List.to_tuple
    end

    def solve(input) do
        input
        |> String.split("\n")
        |> Enum.map(&parse_line/1)
        |> Enum.unzip
        |> then(fn {a, b} -> {a, Enum.frequencies(b)} end)
        |> process
    end
end

AOC.solve 1