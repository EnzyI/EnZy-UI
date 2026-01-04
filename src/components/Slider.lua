local Slider = {}
Slider.__index = Slider

function Slider.new(Parent, cfg)
    local self = setmetatable({}, Slider)
    return self
end

return Slider
