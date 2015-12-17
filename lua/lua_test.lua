local complex = require "lua_complex"

for k,v in pairs(complex.ci) do
    print(k, "=>", v)
end

local c1 = complex.new(1, 1)
local c2 = complex.new(2, 2)
local c3 = complex.add(c1, c2)

complex.print_complex(c3)










