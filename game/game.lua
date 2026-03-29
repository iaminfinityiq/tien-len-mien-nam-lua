Game = {}
Game.__index = Game

package.path = package.path .. ";../?.lua"

local random = require("helpers.random")
local deck = require("cards.deck")
local card_values = require("cards.card_value")
local card_types = require("cards.card_type")

function Game:new(players)
    local _ = setmetatable({}, self)

    self.players = players
    shuffle(self.players)

    local d = Deck:new()
    d:deal_cards(self.players)
end

function Game:discard_threes()
    local three_spades_guy = 1000000000000000000
    for i = 1, self.players:size(), 1 do
        local dummy = self.players:get(i).cards:copy()
        self.players:get(i).cards = List:new()
        
        for j = 1, dummy:size(), 1 do
            local card = dummy:get(j)
            if card.value == CardValue:get("3") then
                if card.type == CardType:get("Spades") then
                    three_spades_guy = i
                end

                goto continue
            end
            ::continue::
        end
    end

    return three_spades_guy
end

function Game:start_round(winner_idx)
    local remaining_players = List:new()
    local iter_count = 0
    local index = winner_idx
    while iter_count < self.players:size() do
        if self.players:get(index).cards:size() == 0 then
            index = index + 1
            if index > self.players:size() then
                index = 1
            end

            iter_count = iter_count + 1
        end

        remaining_players:push(index)
        index = index + 1
        if index > self.players:size() then
            index = 1
        end

        iter_count = iter_count + 1
    end
end