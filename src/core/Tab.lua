local Tab = {}
Tab.__index = Tab

local Button = require(script.Parent.Parent.components.Button)
local Toggle = require(script.Parent.Parent.components.Toggle)

function Tab.new(Parent, name)
    local self = setmetatable({}, Tab)

    local Container = Instance.new("Frame")
    Container.Size = UDim2.fromScale(1,1)
    Container.BackgroundTransparency = 1
    Container.Parent = Parent

    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0,8)

    self.Container = Container
    return self
end

function Tab:CreateButton(cfg)
    return Button.new(self.Container, cfg)
end

function Tab:CreateToggle(cfg)
    return Toggle.new(self.Container, cfg)
end

return Tab
