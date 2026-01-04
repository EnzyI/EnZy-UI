local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(Parent, cfg)
    local self = setmetatable({}, Toggle)

    local State = cfg.CurrentValue or false

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-20,0,40)
    Btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Btn.Text = cfg.Name or "Toggle"
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Parent = Parent

    Btn.MouseButton1Click:Connect(function()
        State = not State
        if cfg.Callback then
            cfg.Callback(State)
        end
    end)

    return self
end

return Toggle
