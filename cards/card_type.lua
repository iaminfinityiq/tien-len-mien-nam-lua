package.path = package.path .. ";/../?.lua"

local enum = require("enums.enums")

CardType = Enum:new()
CardType:enum("Spades")
CardType:enum("Clubs")
CardType:enum("Diamonds")
CardType:enum("Hearts")