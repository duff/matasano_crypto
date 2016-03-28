defmodule SetOne do

  use Bitwise

  def hex_to_base64(string) do
    string
    |> Base.decode16!(case: :mixed)
    |> Base.encode64
  end

  def fixed_xor(string_one, string_two) do
    Enum.zip(decoded_list(string_one), decoded_list(string_two))
    |> Enum.map(fn({a, b}) -> bxor(a, b) end)
    |> List.to_string
    |> Base.encode16(case: :lower)
  end


  defp decoded_list(string) do
    Base.decode16!(string, case: :mixed) |> String.to_char_list
  end

end
