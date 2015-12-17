print("hello world")

function fact(n)
    if n <= 1 then
       return 1
    else
       return n * fact(n -1)
    end
end

--[[
--dofile命令的使用
--dofile("lua_hello.lua")
--n = fact(4) --fact()为lua_hello文件中定义的函数
--print(n)
--]]

function foo(a, b, c, ...)
    local sum = a + b
    return sum,c
end
local r1, r2 = foo(1, "123", "hello")
print(r1, r2)

local a = {}
local b = {x = 1, ["hello,"]= "world!"}
a[1] = 100
a["astring"] = "ni, hao!"
a["a table"] = b
print(a.astring)

for k, v in pairs(a) do
    print(k, "=>", v);
end





