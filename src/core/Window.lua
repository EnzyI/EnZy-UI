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

    local Top = Instance.new("Frame")
    Top.Size = UDim2.fromScale(1,0.12)
    Top.BackgroundTransparency = 1
    Top.Parent = Main

    local TabsBar = Instance.new("Frame")
    TabsBar.Size = UDim2.fromScale(0.3,1)
    TabsBar.BackgroundTransparency = 1
    TabsBar.Parent = Top

    local TabsLayout = Instance.new("UIListLayout", TabsBar)
    TabsLayout.Padding = UDim.new(0,6)

    local TabsHolder = Instance.new("Frame")
    TabsHolder.Size = UDim2.fromScale(1,0.88)
    TabsHolder.Position = UDim2.fromScale(0,0.12)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.Parent = Main

    self.Main = Main
    self.TabsHolder = TabsHolder
    self.TabsBar = TabsBar
    self.Tabs = {}
    self.CurrentTab = nil

    return self
end

function Window:CreateTab(name)
    local tab = TabClass.new(self, name)
    table.insert(self.Tabs, tab)

    if not self.CurrentTab then
        self:SwitchTab(tab)
    end

    return tab
end

function Window:SwitchTab(tab)
    if self.CurrentTab then
        self.CurrentTab.Container.Visible = false
        self.CurrentTab.Button.TextColor3 = Color3.fromRGB(160,160,160)
    end

    self.CurrentTab = tab
    tab.Container.Visible = true
    tab.Button.TextColor3 = Color3.new(1,1,1)
end

return Window
