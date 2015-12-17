--[[
--创建一个简单连表
--]]
local list = {next = nil, value = nil}

for i = 1, 5 do
    list = {next = list, value = i}
end

local l = list
while l do
    print(l.value)
    l = l.next
end


local polyline = {
    color = "blue",
    thickness = 2,
    npoints = 4,
    {x = 0, y = 0},
    {x = -10, y = 0},
    {x = -10, y = 1},
    {x = 0, y = 1},
    dtype = "polyline"
}

for k,v in pairs(polyline) do
    print(k, "=>", v)
end
