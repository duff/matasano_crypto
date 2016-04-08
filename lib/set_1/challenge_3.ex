defmodule Set1.Challenge3 do

  @frequently_used [" ", "e", "t", "a", "o", "i"]

  use Bitwise

  def single_byte_xor_cipher(input) do
    decoded = decoded_list(input)
    key_msgs = Enum.map(1..256, fn(key) -> { key, xored(decoded, key) } end)
    Enum.max_by(key_msgs, fn({_, msg}) -> score(msg) end)
  end

  defp score(message) do
    String.graphemes(message)
    |> Enum.count(&(&1 in @frequently_used))
  end

  defp xored(chars, key) do
    Enum.map(chars, &(bxor(&1, key))) |> to_string
  end

  defp decoded_list(string) do
    Base.decode16!(string, case: :mixed) |> String.to_char_list
  end

end
