local EnZyUI = require(game.ReplicatedStorage.EnZyUI)

local Window = EnZyUI:CreateWindow({
    Name = "EnZy UI"
})

local Tab = Window:CreateTab("Main")

Tab:CreateButton({
    Name = "Test",
    Callback = function()
        print("EnZy")
    end
})

Tab:CreateToggle({
    Name = "Toggle",
    Callback = function(v)
        print(v)
    end
})
