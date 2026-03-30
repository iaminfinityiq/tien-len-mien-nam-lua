local terminal = require("helpers.terminal")
local list = require("list.list")
local vn = require("helpers.valid_number")
local hand = require("game.hand")
local game = require("game.game")
local repr = require("helpers.repr")
local card_type = require("cards.card_type")
local card_value = require("cards.card_value")

local result = 0
while true do
    cls()
    local answer = input("How many players are playing? ")

    if not valid_number(answer) then
        print(answer .. " is not a valid number")
        petc()
        goto continue
    end

    if check_boundaries(answer, 8) then
        result = tonumber(answer)
        break
    end

    print(answer .. " is simply just a number that's too large")
    petc()
    ::continue::
end

local players = List:new()
for i = 1, result, 1 do
    local name = input("P" .. i .. ": ")
    local player = Hand:new(name)
    players:push(player)
end
print(players:size())
local g = Game:new(players)
for i = 1, players:size(), 1 do
    cls()
    print("It is " .. players:get(i).name .. "'s turn to take a look at their cards. Please pass the device to them.")
    petc()

    cls()
    print(players:get(i).name .. ", you currently have " .. players:get(i).cards:size() .. " cards on your hand. Please take a look at them:")
    local flag = false
    for j = 1, players:get(i).cards:size(), 1 do
        print("[" .. j .. "] " .. card_repr(players:get(i).cards:get(j)))
        if players:get(i).cards:get(j).type == CardType:get("Spades") and players:get(i).cards:get(j).value == CardValue:get("3") then
            flag = true
        end
    end

    if flag then
        print("You are going to play first as you have a 3 of Spades on your hand.")
    end

    petc()
end