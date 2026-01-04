local Button = {}
Button.__index = Button

function Button.new(Parent, cfg)
    local self = setmetatable({}, Button)

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-20,0,40)
    Btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Btn.Text = cfg.Name or "Button"
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Parent = Parent

    Btn.MouseButton1Click:Connect(function()
        if cfg.Callback then
            cfg.Callback()
        end
    end)

    return self
end

return Button
