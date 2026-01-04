local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(Parent, cfg)
    local self = setmetatable({}, Dropdown)
    return self
end

return Dropdown
