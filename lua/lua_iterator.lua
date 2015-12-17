local function travel(array)
    local index = 1
    return function()
        local ret = array[index]
        index = index + 1
        return ret
    end
end

local function foreach(array, action)
    for element in travel(array) do
        action(element)
    end
end

foreach({1, 2, 3}, print)
