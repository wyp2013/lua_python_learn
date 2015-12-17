local test = {"tom", "Mary", "jam", "hey"}

print(table.concat(test, ":"))
print(table.concat(test, "_", 1, 2))
print(table.maxn(test))


local network = {
    {name = "Tom", ip = "120.112.1.0"},
    {name = "Mary", ip = "202.115.32.36"},
    {name = "Jam", ip = "202.115.32.39"}
}

table.insert(network, 1, {name = "wyp", ip = "www.www.www.www"})
print(table.maxn(network), "Len:" ,#network)
for i = 1, #network do
    print(i,"->",network[i].name, "->",network[i].ip)
end

function print_elem(i, t)
    print(i,"->", t.name, "->", t.ip)
end

table.foreach(network, print_elem) 










 
