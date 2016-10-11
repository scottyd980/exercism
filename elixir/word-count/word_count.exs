defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  import Logger

  @spec count(String.t) :: map
  def count(sentence) do
    String.split(sentence)
    |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end)
  end

  defp count_word_length([head | tail], map) do
    cond do
      Map.has_key?(map, head) ->
        Map.update!(map, head, fn value -> value + 1 end)
        count_word_length(tail, map)
      !Map.has_key?(map, head) ->
        Map.put_new(map, head, 1)
        count_word_length(tail, map)
    end
  end

  defp count_word_length([], map) do
    map
  end
end
