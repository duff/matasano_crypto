defmodule Set1.Challenge3Test do
  use ExUnit.Case, async: true

  test "single byte XOR cipher" do
    input = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
    { key, decrypted_message } = Set1.Challenge3.single_byte_xor_cipher(input)
    assert decrypted_message == "Cooking MC's like a pound of bacon"
    assert key == 88
  end

end
