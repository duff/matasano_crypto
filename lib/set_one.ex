defmodule SetOne do
  @frequently_used [" ", "e", "t", "a", "o", "i"]

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

  def single_byte_xor_cipher(input) do
    decoded = decoded_list(input)
    key_msgs = Enum.map(1..256, fn(key) -> { key, xored(decoded, key) } end)

    { key, msg } = Enum.max_by(key_msgs, fn({_, msg}) -> score(msg) end)
    { key, to_string(msg) }
  end

  defp score(message) do
    Enum.count(message, &(<<&1>> in @frequently_used))
  end

  defp xored(chars, key) do
    Enum.map(chars, &(bxor(&1, key)))
  end

  defp decoded_list(string) do
    Base.decode16!(string, case: :mixed) |> String.to_char_list
  end

end
