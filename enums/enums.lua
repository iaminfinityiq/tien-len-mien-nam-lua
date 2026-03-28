Enum = {}
Enum.__index = Enum

function Enum:new()
    local _ = setmetatable({}, self)
    
    local iterated_index = 1
    local enum_table = {}

    function self:enum(key)
        enum_table[key] = iterated_index
        iterated_index = iterated_index + 1
    end

    function self:get(key)
        return enum_table[key]
    end

    return self
end