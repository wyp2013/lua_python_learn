--返回字符串的长度
local s = "Hello World"
print(string.len(s))


--重复n次字符串s
print(string.rep(s, 2)) --s重复两次


--大小写字符串转换
s = string.lower(s) --s = hello world
s = string.upper(s) --s = HELLO WORLD


--截取字符串
local substr = string.sub(s, 6, -1) --s = WORLD
print(substr)


--将一个数字转化成字符
local ch = string.char(97) --ch = a
print(ch)


--将一个字符转换成数字
print(string.byte("abc"))
print(string.byte("abc", 2))
print(string.byte("abc", -1))


--对字符串进行格式化输出
PI = 3.1415926
print(string.format("pi = %0.4f", PI))


--[[string模式匹配的函数]]--

--find
local str = "hello world hello hi hello"
local sb, se = string.find(str, "hello") --只查找一个子串，返回起始和结束位置
print(sb, ",", se, "=>", string.sub(str, sb, se))

local t = {}
local i = 0
--查找所有子串
while true do
    i = string.find(str, "hello", i+1) --从索引位置为i+1处查找子串
    if i == nil then 
        break
    end
    table.insert(t, i)
end
for k,v in pairs(t) do
    print(k, "=>", v, "=>", string.sub(str, v, v+string.len("hello")-1))
end

--gfind遍历一个字符串内所有匹配模式的子串
local t2 = {}
local w = {}
for w in string.gfind(str, "hello") do
    table.insert(t2, w)
end
for k,v in pairs(t2) do
    print(k, "->", v)
end

t2 = string.gfind(str, "hello") --返回所有的hello,是集合
for e in t2 do
    print(e)
end


--gsub用来查找匹配模式的串，并将使用替换串其替换掉
local tmp = string.gsub(str, "hello", "hihi") --全部替换
print(tmp)
local count = nil
tmp, count = string.gsub(str, "hello", "hihi", 1) --替换1次
print(tmp, " 次数：", count)
tmp, count = string.gsub(str, "hello", "hihi", 4) --替换4次
print(tmp, " 次数：", count)

--正则表达式匹配
--这部分先放在这里










