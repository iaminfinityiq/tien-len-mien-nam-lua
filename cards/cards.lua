Card = {}
Card.__index = Card

function Card:new(type, value)
    local _ = setmetatable({}, self)
    self.type = type
    self.value = value

    return self
end