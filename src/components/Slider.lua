local Slider = {}
Slider.__index = Slider

local UIS = game:GetService("UserInputService")

function Slider.new(Parent, cfg)
    local self = setmetatable({}, Slider)

    local Min = cfg.Range[1]
    local Max = cfg.Range[2]
    local Value = cfg.CurrentValue or Min

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,-20,0,50)
    Frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
    Frame.Parent = Parent

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.fromScale(1,0.4)
    Title.BackgroundTransparency = 1
    Title.Text = cfg.Name
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Parent = Frame

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1,-20,0,6)
    Bar.Position = UDim2.fromScale(0,0.7)
    Bar.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Bar.Parent = Frame

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.fromScale((Value-Min)/(Max-Min),1)
    Fill.BackgroundColor3 = Color3.new(1,1,1)
    Fill.Parent = Bar

    local Dragging = false

    local function update(input)
        local pos = math.clamp(
            (input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X,
            0, 1
        )
        Fill.Size = UDim2.fromScale(pos,1)
        Value = math.floor(Min + (Max-Min)*pos)
        if cfg.Callback then
            cfg.Callback(Value)
        end
    end

    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = true
            update(input)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if Dragging and (
            input.UserInputType == Enum.UserInputType.Touch
            or input.UserInputType == Enum.UserInputType.MouseMovement
        ) then
            update(input)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            Dragging = false
        end
    end)

    return self
end

return Slider
