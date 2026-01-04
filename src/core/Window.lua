local Window = {}
Window.__index = Window

local TabClass = require(script.Tab)

function Window.new(ScreenGui, cfg)
    local self = setmetatable({}, Window)

    local Main = Instance.new("Frame")
    Main.Size = UDim2.fromScale(0.45, 0.55)
    Main.Position = UDim2.fromScale(0.275, 0.225)
    Main.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Main.Parent = ScreenGui

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Size = UDim2.fromScale(1,1)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Main

    self.Main = Main
    self.TabsHolder = TabsHolder
    self.Tabs = {}

    return self
end

function Window:CreateTab(name)
    local tab = TabClass.new(self.TabsHolder, name)
    table.insert(self.Tabs, tab)
    return tab
end

return Window
