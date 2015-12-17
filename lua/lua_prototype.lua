local person = {name = "wyp", id = "1"}
function person:new(extension)
    local t = setmetatable(extension or {}, self)
    self.__index = self
    return t
end

function person:setName(name)
    self.name = name
end

function person:getName()
    return  self.name
end

function person:setId(id)
    self.id = id
end

function person:getId()
    return self.id
end

local pp = person:new()
print(pp:getName())
print(pp:getId())

pp:setName("dandan")
pp:setId("2222")

print(pp:getName())
print(pp:getId())
print(person:getName())
print(person:getId())

--[[
--这个原型模式的可扩张性很强
--]]
local student = person:new({age = "22"})
function student:setAge(age)
    self.age = age
end

function student:getAge()
    return self.age
end

local s1 = student:new()
print(s1:getAge())
s1:setAge(23)
print(s1:getAge())
print(student:getAge())


