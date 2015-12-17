local function createCountDown(seconds)
    local mill_seconds = seconds * 1000
    local function countDown() 
        mill_seconds = mill_seconds - 1
        return mill_seconds
    end
    return countDown
end

local time1 = createCountDown(1)
for i = 1, 7, 2 do
    print(time1())
end


