defmodule AOC.Day do
    defp comb(0, _), do: [[]]
    defp comb(_, []), do: []
    defp comb(m, [h|t]) do
        (for l <- comb(m-1, t), do: [h|l]) ++ comb(m, t)
    end

    defp parse_report(line) do
        line |> String.split(" ") |> Enum.map(&String.to_integer/1)
    end

    defp explode_report(report) do
        comb(length(report) - 1, report)
    end

    defp process_report(report) do
        chunks = report |> Enum.chunk_every(2, 1, :discard)
        
        increasing = chunks |> Enum.all?(fn [a, b] -> b - a in 1..3 end)
        decreasing = chunks |> Enum.all?(fn [a, b] -> b - a in -1..-3 end)

        increasing || decreasing
    end

    defp process_reports(reports) do
        reports |> Enum.any?(&process_report/1)
    end

    def solve(input) do
        input
        |> String.trim
        |> String.split("\n")
        |> Enum.map(&parse_report/1)
        |> Enum.map(&explode_report/1)
        |> Enum.filter(&process_reports/1)
        |> Enum.count
    end
end

AOC.solve 2