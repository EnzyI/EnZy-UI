local Library = {}
Library.__index = Library
Library.Version = "1.0.0"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EnZyUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local WindowClass = require(script.Window)

function Library:CreateWindow(cfg)
    local window = WindowClass.new(ScreenGui, cfg)
    return window
end

return setmetatable({}, Library)
