List = {}
List.__index = List

function List:new()
    local _ = setmetatable({}, self)

    local parent_list = {}
    local list_size = 0
    
    function self:size()
        return list_size
    end

    function self:push(element)
        list_size = list_size+1
        parent_list[list_size] = element
    end

    function self:get(index)
        return parent_list[index]
    end

    function self:copy()
        local returned = List:new()
        for i = 1, list_size do
            returned:push(self:get(i))
        end

        return returned
    end

    return self
end