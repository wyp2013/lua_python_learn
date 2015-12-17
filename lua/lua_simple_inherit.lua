local function createPeople(name, age, sex)
    local info = {name = name, age = age, sex = sex}

    function info:setName(name)
        self.name = name
    end

    function info:getName()
        return self.name
    end

    function info:setAge(age)
        self.age = age
    end

    function info:getAge()
        return self.age
    end

    function info:setSex(sex)
        self.sex = sex
    end

    function info:getSex()
        return self.sex
    end

    return info
end

local function createStudent(name, age, sex, id, address)
    local stu = createPeople(name, age, sex)
    stu.id = id
    stu.address = address

    function stu:setId(id)
        self.id = id
    end

    function stu:getId()
        return self.id
    end

    function stu:setAddress(address)
        self.address = address
    end

    function stu:getAddress()
        return self.address
    end

    return stu
end

local stu = createStudent("zhouwei", "24", "man", "09190329", "earth")
print("student's name:", stu:getName())
print("student's age:", stu:getAge())
print("student's sex:", stu:getSex())
print("student's id:", stu:getId())
print("student's address:", stu:getAddress())

stu:setAge(25)
stu:setAddress("henan dengzhou")

print("student's age:", stu:getAge())
print("student's address:", stu:getAddress())
