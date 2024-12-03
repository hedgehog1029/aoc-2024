defmodule AOC.Day do
    defp parse_report(line) do
        line |> String.split(" ") |> Enum.map(&String.to_integer/1)
    end

    defp process_report(report) do
        chunks = report |> Enum.chunk_every(2, 1, :discard)
        
        increasing = chunks |> Enum.all?(fn [a, b] -> b - a in 1..3 end)
        decreasing = chunks |> Enum.all?(fn [a, b] -> b - a in -1..-3 end)

        increasing || decreasing
    end

    def solve(input) do
        input
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&parse_report/1)
        |> Enum.filter(&process_report/1)
        |> Enum.count
    end
end

AOC.solve 2