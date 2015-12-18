--os.time([])返回据标准时间的差值--
print(os.time())
print(os.time({year=1970, month=1, day=1, hour=8, min=0, sec=0}))
print(os.time({year=1970, month=1, day=1, hour=8, min=1, sec=0}))

--[[
--返回据现在的时间差值
--]]

print(os.date("today is %Y-%B-%d %H:%M:%S"))
print(os.date("today is %x %X"))

t = os.date("*t", os.time());
for i, v in pairs(t) do
      print(i,"->",v);
end

print(os.getenv("HOME"))


function createDir(dirname)
    os.execute("mkdir " ..dirname)
end







