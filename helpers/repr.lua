package.path = package.path .. ";../?.lua"

local card_types = require("cards.card_type")
local card_values = require("cards.card_value")
local cards = require("cards.cards")

function type_repr(type)
    if type == CardType:get("Spades") then
        return "Spades"
    end

    if type == CardType:get("Clubs") then
        return "Clubs"
    end

    if type == CardType:get("Diamonds") then
        return "Diamonds"
    end

    return "Hearts"
end

function value_repr(value)
    if value == CardValue:get("3") then
        return "3"
    end

    if value == CardValue:get("4") then
        return "4"
    end

    if value == CardValue:get("5") then
        return "5"
    end

    if value == CardValue:get("6") then
        return "6"
    end

    if value == CardValue:get("7") then
        return "7"
    end

    if value == CardValue:get("8") then
        return "8"
    end

    if value == CardValue:get("9") then
        return "9"
    end

    if value == CardValue:get("10") then
        return "10"
    end

    if value == CardValue:get("J") then
        return "J"
    end

    if value == CardValue:get("Q") then
        return "Q"
    end

    if value == CardValue:get("K") then
        return "K"
    end

    if value == CardValue:get("A") then
        return "A"
    end

    return "2"
end

function card_repr(card)
    return value_repr(card.value) .. " of " .. type_repr(card.type)
end