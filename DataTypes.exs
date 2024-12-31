#Numbers : 0x(hicsa),0o(Octa),0b(binary),4_000_000,4e6
#atoms are fast beacase they are stored in a table and the assigned varibale contains the refernces so comparison are fast
IO.puts (false == :false)
#Tuples tup={:wew,"hi",12}
tup={:wew,"hi",12}
IO.puts(elem(tup,0))
new_tup=put_elem(tup,2,"Hey")
IO.inspect(new_tup)
#lists
list=[1,"hi",:ok]
IO.puts(length(list))
IO.puts Enum.at(list,1)
IO.puts hd(list)
IO.inspect tl(list)
IO.inspect([1|[2|[3|[]]]])
list1=[22|list]
IO.inspect(list1)
#KeywordList keylist=[ok:"zew",wew:"zew"] == [:ok => "zew" , :wew =>"zew"] == [{:ok,"zew"},{:wew,"zew"}]
#maps
map=%{"key"=>"Value"}
IO.inspect map["kely"]
new_map=%{map|"key"=>"zew"}
IO.inspect new_map
