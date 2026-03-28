package.path = package.path .. ";../?.lua"

local enum = require("enums.enums")

CardValue = Enum:new()
CardValue:enum("3")
CardValue:enum("4")
CardValue:enum("5")
CardValue:enum("6")
CardValue:enum("7")
CardValue:enum("8")
CardValue:enum("9")
CardValue:enum("10")
CardValue:enum("J")
CardValue:enum("Q")
CardValue:enum("K")
CardValue:enum("A")
CardValue:enum("2")