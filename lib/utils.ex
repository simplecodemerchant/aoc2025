defmodule Advent2025.Utils do
  defmodule List do
    @spec strict_at(list, integer) :: any | nil
    def strict_at(_list, index) when index < 0, do: nil
    def strict_at(list, index), do: Enum.at(list, index)

    @spec strict_at(list, integer, any) :: any
    def strict_at(_list, index, default) when index < 0, do: default
    def strict_at(list, index, default), do: Enum.at(list, index, default)
  end

  defmodule Str do
    @spec strict_at(String.t(), integer) :: any | nil
    def strict_at(_string, index) when index < 0, do: nil
    def strict_at(string, index), do: String.at(string, index)

    @spec strict_at(list(String.grapheme()), Range.t(), any) :: list(any)
    def strict_at(nil, %Range{} = range, default) do
      Enum.map(range, fn _index ->
        default
      end)
    end

    def strict_at(graphemes, %Range{} = range, default) when is_list(graphemes) do
      Enum.map(range, fn index ->
        Advent2025.Utils.List.strict_at(graphemes, index, default)
      end)
    end

    @spec strict_at(list(String.grapheme()), integer(), any) :: any
    def strict_at(graphemes, index, default) when is_list(graphemes) do
      Advent2025.Utils.List.strict_at(graphemes, index, default)
    end

    # Ok, this is kinda cool
    @spec strict_at(String.t(), Range.t()) :: list(any)
    def strict_at(string, %Range{} = range, default) when is_binary(string) do
      IO.puts("string")

      Enum.map(range, fn index ->
        Str.strict_at(string, index, default)
      end)
    end

    @spec strict_at(String.t(), integer, any) :: any
    def strict_at(nil, _index, _default), do: nil
    def strict_at(_string, index, default) when index < 0, do: default
    def strict_at(string, index, default), do: String.at(string, index) || default
  end
end
