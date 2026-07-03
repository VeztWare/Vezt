--[[
  This Script Was Made By IamHamzaBG#6137.
  Its For You To Learn From It, Do NOT Skid It for god's sake.
  If you want to use this script source, then it’ll be respectable for you to credit me.
]]

local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/KavoUi/main/KavoUi.lua"))()
local window = kavoUi.CreateLib("Vezt | Math Block Race", "VeztPur")

local InfoTab = window:NewTab("Info")
local Info = InfoTab:NewSection("Made By IamHamzaBG#6137")
Info:NewLabel("+ Added Lobby Check (AutoWin)")
Info:NewLabel("+ Added AntiAFK (Built-in)")

local MainTab = window:NewTab("Main")
local Main = MainTab:NewSection("Have Fun.")

function antiafk()
    local funnyconnection = getconnections or get_signal_cons
    if funnyconnection then
        for i, v in pairs(funnyconnection(game.Players.LocalPlayer.Idled)) do
            v:Disable()
        end
    else
        local VirtualUser = game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end

function CheckLobby()
    for i, v in pairs(workspace:GetDescendants()) do
        if v.Name == "Smooth Square" and v.BrickColor == BrickColor.new("Lilac") then
            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 80 then
                return true
            end
        end
    end
    return false
end

Main:NewToggle("AutoWin", "?", function(is)
    if is then
        _G.AutoWin = true
        while _G.AutoWin and wait() do
            if not CheckLobby() then
                workspace.Gravity = 0
                game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(18.522, 1.876, -798.072))
            end
        end
    else
        _G.AutoWin = false
        wait(1)
        workspace.Gravity = 196.2
    end
end)

Main:NewLabel("Removes Every Purchase Prompt In The Game")
Main:NewButton("Remove Purchase Prompt", "?", function()
    if game.CoreGui:FindFirstChild("PurchasePrompt") then
        game.CoreGui.PurchasePrompt:Destroy()
    end
end)
