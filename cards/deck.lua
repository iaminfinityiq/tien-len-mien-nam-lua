Deck = {}
Deck.__index = Deck

package.path = package.path .. ";../?.lua"

local card_type = require("cards.card_type")
local card_value = require("cards.card_value")
local list = require("list.list")
local cards = require("cards.cards")
local random = require("helpers.random")

function Deck:new()
    local _ = setmetatable({}, self)

    local cards = List:new()
    
    local card_types = {
        CardType:get("Spades"),
        CardType:get("Clubs"),
        CardType:get("Diamonds"),
        CardType:get("Hearts")
    }

    local card_values = {
        CardValue:get("3"),
        CardValue:get("4"),
        CardValue:get("5"),
        CardValue:get("6"),
        CardValue:get("7"),
        CardValue:get("8"),
        CardValue:get("9"),
        CardValue:get("10"),
        CardValue:get("J"),
        CardValue:get("Q"),
        CardValue:get("K"),
        CardValue:get("A"),
        CardValue:get("2")
    }

    for i = 1, #card_types, 1 do
        local card_type = card_types[i]
        for j = 1, #card_values, 1 do
            local card_value = card_values[j]
            local card = Card:new(card_type, card_value)

            cards:push(card)
        end
    end

    shuffle(cards)
    function Deck:deal_cards(players)
        local player_idx = 1
        local deal_idx = 1
        while deal_idx <= cards:size() do
            players[player_idx]:receieve_card(self.cards[deal_idx])
            player_idx = player_idx + 1
            if player_idx > players:size() then
                player_idx = 1
            end
            
            deal_idx = deal_idx + 1
        end
    end

    return self
end