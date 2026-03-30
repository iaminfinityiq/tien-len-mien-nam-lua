function valid_number(value)
    if value == "" then
        return false
    end

    local zero = string.byte("0")
    local nine = string.byte("9")
    for i = 1, #value, 1 do
        local ascii = string.byte(value)
        if ascii < zero or ascii > nine then
            return false
        end
    end

    return true
end

function check_boundaries(compared, bounds)
    if #compared > 10 then
        return false
    end

    return tonumber(compared) <= bounds
end