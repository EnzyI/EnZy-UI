local Tab = {}
Tab.__index = Tab

local ButtonComponent = require(script.Parent.Parent.components.Button)
local ToggleComponent = require(script.Parent.Parent.components.Toggle)
local SliderComponent = require(script.Parent.Parent.components.Slider)

function Tab.new(Window, name)
    local self = setmetatable({}, Tab)

    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1,-10,0,36)
    TabButton.BackgroundTransparency = 1
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(160,160,160)
    TabButton.Parent = Window.TabsBar

    local Container = Instance.new("Frame")
    Container.Size = UDim2.fromScale(1,1)
    Container.BackgroundTransparency = 1
    Container.Visible = false
    Container.Parent = Window.TabsHolder

    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0,8)

    TabButton.MouseButton1Click:Connect(function()
        Window:SwitchTab(self)
    end)

    self.Button = TabButton
    self.Container = Container

    return self
end

function Tab:CreateButton(cfg)
    return ButtonComponent.new(self.Container, cfg)
end

function Tab:CreateToggle(cfg)
    return ToggleComponent.new(self.Container, cfg)
end

function Tab:CreateSlider(cfg)
    return SliderComponent.new(self.Container, cfg)
end

return Tab
