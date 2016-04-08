defmodule Set1.Challenge1 do

  def hex_to_base64(string) do
    string
    |> Base.decode16!(case: :mixed)
    |> Base.encode64
  end

end
