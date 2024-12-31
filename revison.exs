defmodule Revision do

def writefile (file) do
 file |>
 File.stream!() |>
 Stream.map(&(String.replace(&1,"\n","")))|>
 printing_lines()
end
defp printing_lines(lines) do
  lines|>
  Stream.map(&(String.split(&1,"")))
  |>Enum.each(&(printing_each_lines(&1)))
end
defp printing_each_lines(lines) do
   for line <- lines ,do: printing_each_char(line)

  IO.write("\n")
  :timer.sleep(500)
end

defp printing_each_char(line) do
  line|>IO.write()
  :timer.sleep(100)
end

end


Revision.writefile("first.txt")
