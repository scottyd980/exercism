defmodule Bob do

  def hey(input) do
    cond do
        isEmpty input ->
          "Fine. Be that way!"
        lastChar(input) == "?" ->
          "Sure."
        isYelling(input) ->
          "Whoa, chill out!"
        true ->
          "Whatever."
    end
  end

  defp lastChar(input) do
    input
    |> String.at(String.length(input)-1)
  end

  defp isEmpty(input) do
    input
    |> String.trim
    |> String.length == 0
  end

  defp isYelling(input) do
    String.match?(input, ~r/\p{L}/) && input == String.upcase(input)
  end
end
