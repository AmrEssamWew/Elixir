defmodule Game_client do
  @moduledoc """
  Documentation for `Game`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Game.hello()
      :world

  """
  def main(_),do: play()
  def play do
    IO.puts("Welcome to game of stones lt's start the game")
    Game_server.start(initial_stones_num())
    gameturn()
  end
  def initial_stones_num() do
    IO.gets("Enter  the total number of stones we would start with  ")|>String.trim()|>Integer.parse()|> parse(:total_stones)
  end
def   gameturn() do
  stones_to_take=IO.gets("Enter the number of stones to take\n")|>String.trim()|>Integer.parse()|> parse(:stones_to_take)
  case Game_server.take(stones_to_take) do
     {:Winner,m}->IO.puts(m)
     Game_client.play()
     {_,m}->IO.puts(m)
     gameturn()


  end
end



  def parse({input,_},_),do: input
  def parse(:error,:total_stones)do
    IO.puts("Can't make this value the total stones number so we are sticking with the default stones number '30' \n")
    30
  end
  def parse(:error,:stones_to_take),do: 0

end
