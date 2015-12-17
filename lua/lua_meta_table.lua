local t = {}
local m = {a = "and", b = "li lei", c = "han meimei"}

setmetatable(t, {__index = m})

---[[
--下面这样输出是没有值得
--]]
for k,v in pairs(t) do
    print(k, "=>", v)
end

print(t.a, " ", t.b, " ", t.c)

local function add(t1, t2)
    assert(#t1 == #t2)
    local len = #t1
    for i = 1, len do
        t1[i] = t1[i] + t2[i]
    end
    return t1
end

local t1 = setmetatable({1, 2, 3}, {__add = add})
local t2 = setmetatable({10, 11, 12}, {_add = add})

local function print_table(t)
    for k,v in pairs(t) do
        print(k, "=>", v)
    end
end

print_table(t1)
print_table(t2)
local t3 = t1 + t2
print_table(t3)

