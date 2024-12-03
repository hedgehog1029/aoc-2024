defmodule AOC.Day do
    defp run([], %{sum: sum}) do
        sum
    end

    defp run([["do"] | tail], state) do
        run(tail, %{state | enabled: true})
    end

    defp run([["don't"] | tail], state) do
        run(tail, %{state | enabled: false})
    end

    defp run([["mul", x, y] | tail], %{enabled: enabled, sum: sum} = state) do
        if enabled do
            product = String.to_integer(x) * String.to_integer(y)
            run(tail, %{state | sum: sum + product})
        else
            run(tail, state)
        end
    end

    def solve(input) do
        Regex.scan(~r/(mul|do|don't+)\((?:(\d{1,3}),(\d{1,3}))?\)/, input, capture: :all_but_first)
        |> run(%{enabled: true, sum: 0})
    end
end

AOC.solve 3