function shuffle(arr)
    for i = 1, arr:size(), 1 do
        local position = math.random(i, arr:size())
        arr:swap(i, position)
    end
end