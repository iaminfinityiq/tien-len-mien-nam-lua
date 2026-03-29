Hand = {}
Hand.__index = Hand

local list = require("list.list")

function Hand:new(name)
    local _ = setmetatable({}, self)
    self.name = name
    self.cards = List:new()
end

function Hand:receieve_card(card)
    self.cards:push(card)
end

