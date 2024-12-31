defmodule FileStream do
  def stream_file do
    File.stream!("first.txt") |> Stream.map(&(String.replace(&1,"/n",""))) |> line()

  end
  def line(file) ,do: Enum.each(file,&(write_line(&1)))
  def write_line(line) do
    String.split(line,"")|>
    Enum.each(&(write_cha(&1)))
    :timer.sleep(200)
  end
  def write_cha(cha) do
    IO.write(cha)
    :timer.sleep(100)
  end
end

FileStream.stream_file()
