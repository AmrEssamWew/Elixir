revers=fn("")->IO.puts("Empty")
(x) -> x |> String.reverse()|>IO.puts()end
revers.("Zew")
Enum.each(["zew","pew","wee",""],revers)
Enum.each(["zew","pew","wee"],&(IO.puts(&1)))
