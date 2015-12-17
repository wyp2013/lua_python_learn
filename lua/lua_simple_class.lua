function create(name, id)
    local obj = {name = name, id = id}

    function obj:setName(name)
        self.name = name
    end

    function obj:getName()
        return self.name
    end

    function obj:setId(id)
        self.id = id
    end

    function obj:getId()
        return self.id
    end

    return obj
end

local myObj = create("wyp", 09190329)
for k,v in pairs(myObj) do
    print(k, "=>", v)
end

print("myObj's name:", myObj:getName(), "\n")
print("myObj's id:", myObj:getId(), "\n")

myObj:setName("xiao wu")
myObj:setId("09190329")

print("myObj's name:", myObj:getName(), "\n")
print("myObj's id:", myObj:getId(), "\n")


