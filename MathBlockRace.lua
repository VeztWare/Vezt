--[[
  This Script Was Made By IamHamzaBG#6137.
  Its For You To Learn From It, Do NOT Skid It for god's sake.
 if you want to use this script source then itll be respectable for you to credit me.
]]
local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/KavoUi/main/KavoUi.lua"))()
local window = kavoUi.CreateLib("Vezt | Math Block Race","VeztPur")
---Tabs
local InfoTab = window:NewTab("Info")
local Info = InfoTab:NewSection("Made By IamHamzaBG#6137")
Info:NewLabel("+ Added Lobby Check (AutoWin)")
Info:NewLabel("+ Added AntiAFK (Built-in)")
local MainTab = window:NewTab("Main")
local Main = MainTab:NewSection("Time Passed: ")
--Would Be Repectable if you give me credits to this function.
function CheckLobby()
for i,v in pairs(workspace:GetDescendants()) do
if v.Name == "Smooth Square" then
if v.BrickColor == BrickColor.new("Lilac") then
if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 80 then
return true
else
return false
end
end
end
end
end
Main:NewToggle("AutoWin","?", function(is)
if is then
_G.AutoWin = true
while _G.AutoWin and wait() do
if not CheckLobby() then
workspace.Gravity = 0
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(18.522048950195312, 1.87626051902771, -798.0728149414062))
end
end
else
_G.AutoWin = false
wait(1)
workspace.Gravity = 196.2
end
end)
Main:NewLabel("Removes Every Purchase Prompt In The Game")
Main:NewButton("Remove Purchase Prompt","?", function()
game.CoreGui.PurchasePrompt:Destroy()
end)
