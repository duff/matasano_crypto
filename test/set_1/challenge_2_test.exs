defmodule Set1.Challenge2Test do
  use ExUnit.Case, async: true

  test "fixed XOR" do
    result = Set1.Challenge2.fixed_xor("1c0111001f010100061a024b53535009181c", "686974207468652062756c6c277320657965")
    assert result == "746865206b696420646f6e277420706c6179"
  end

end
