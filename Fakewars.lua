local function chat(msg)
local args = {
	[1] = msg,
	[2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))

end
local lplr = game.Players.LocalPlayer
local cam = game:GetService("Workspace").CurrentCamera
local uis = game:GetService("UserInputService")

local uiCount = 0
local scriptName = "Moon"

local modules = {}

local states = {}

local installed = isfile(scriptName)
if not installed then
makefolder(scriptName)
end
local userInput = game:GetService("UserInputService")


function newTab(name)
uiCount += 1
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("ScrollingFrame")
Frame_2.Name = "Frame"
Frame_2.ScrollBarThickness = 0
Frame_2.BorderSizePixel = 0
local UIGridLayout = Instance.new("UIListLayout")
UIGridLayout.Name = "UIGridLayout"
local TextLabel = Instance.new("TextLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = name
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Position = UDim2.new(0.439486176*uiCount/2.7, 0, 0.301745594, 0)
Frame.Size = UDim2.new(0, 157, 0, 400)
Frame.Draggable = true


UICorner.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 1.000
Frame_2.Position = UDim2.new(0.0438880287*uiCount/2.7, 0, 0.154345199, 0)
Frame_2.Size = UDim2.new(0, 163, 0, 303)

UIGridLayout.Parent = Frame_2
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.Padding = UDim.new(0.0004,0,0,0)


TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0438881814*uiCount/2.7, 0, 0.0199366361, 0)
TextLabel.Size = UDim2.new(0, 163, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 29.000
TextLabel.Text = name
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
userInput.InputBegan:Connect(function(input,gameProcessed)
	if input.KeyCode == Enum.KeyCode.RightShift then
	local check = Frame_2
	local check2 = TextLabel
	local check3 = Frame
	if check.Visible == true then
	check.Visible = false
	check2.Visible = false
	check3.Visible = false
	elseif check.Visible == false then
	check.Visible = true
	check2.Visible = true
	check3.Visible = true
	end

	end
	end)
end

local windowapi = {}

windowapi["CreateButton"] = function(argstablemain)
local buttonapi = {}
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local bind = nil

buttonapi["Name"] = argstablemain["Name"]
buttonapi["Tab"] = argstablemain["Tab"]
--buttonapi["bind"] = argstablemain["bind"]
buttonapi["Function"] = argstablemain["Function"]

--argstablemain["bind"] = bind
--local enabled = isfile(buttonapi["Name"]..".txt")

--if enabled then
--table.insert(modules,buttonapi["Name"])
--modules[buttonapi["Name"]] = true
--bind = readfile(buttonapi["Name"]..".txt")
--else
--table.insert(modules,buttonapi["Name"])
--modules[buttonapi["Name"]] = false
--end

local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

TextButton.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")[buttonapi["Tab"]].Frame.Frame
TextButton.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
TextButton.Size = UDim2.new(0, 150, 0, 60)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = buttonapi["Name"]
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000
mouse.KeyDown:connect(function(key)
	if key == --[[buttonapi["bind"]--]] bind then
	if buttonapi["Function"] ~= true then
	buttonapi["Function"] = true
	table.insert(states,argstablemain["Function"])
	states[buttonapi["Name"]] = true
	argstablemain["Function"](true)
	TextButton.BackgroundColor3 = Color3.fromRGB(150, 24, 222)
	else
		table.insert(states,argstablemain["Function"])
	states[buttonapi["Name"]] = false
	argstablemain["Function"](false)
	TextButton.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
	buttonapi["Function"] = false
	end
	end
	end)
TextButton.MouseButton1Down:Connect(function()

	if buttonapi["Function"] ~= true then
--if not enabled then

--end
	table.insert(states,argstablemain["Function"])
	states[buttonapi["Name"]] = true
--[[  buttonapi["Bind"] = true  --]]
	buttonapi["Function"] = true
	TextButton.BackgroundColor3 = Color3.fromRGB(150, 24, 222)
	else
		table.insert(states,argstablemain["Function"])
	states[buttonapi["Name"]] = false
	TextButton.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
--[[	buttonapi["Bind"] = false --]]
	buttonapi["Function"] = false
	end
	if buttonapi["Function"] ~= true then
	argstablemain["Function"](false)
	else
		argstablemain["Function"](true)
	end
	end)

TextButton.MouseButton2Down:Connect(function()
	local ScreenGui = Instance.new("ScreenGui")
	local TextBox = Instance.new("TextBox")
	local UICorner = Instance.new("UICorner")

--Properties:

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	TextBox.Parent = ScreenGui
	TextBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	TextBox.BackgroundTransparency = 0.050
	TextBox.Position = UDim2.new(0.411009163, 0, 0.848780513, 0)
	TextBox.Size = UDim2.new(0, 290, 0, 47)
	TextBox.ZIndex = 99999
	TextBox.Font = Enum.Font.SourceSans
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.TextScaled = true
	TextBox.TextSize = 14.000
	TextBox.TextWrapped = true

	UICorner.Parent = TextBox
	TextBox.FocusLost:Connect(function()
		bind = TextBox.Text
		TextBox:Destroy()
--if enabled then
--delfile(buttonapi["Name"],scriptName)
--writefile(buttonapi["Name"]..".txt",bind)
--else
--writefile(buttonapi["Name"]..".txt",bind)
--end
		end)
	end)
UICorner_2.Parent = TextButton
end

newTab("Combat")
newTab("Movement")
newTab("Visuals")
newTab("Utility")

local InstaKillExploit = windowapi.CreateButton({
	["Name"] = "InstaKillExploit",
	["Tab"] = "Combat",
	
	["Function"] = function(callback)
	if callback then
	_G.InstaKillExploit = true

	while _G.InstaKillExploit do wait()

	if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("wood_sword") then
	local args = {
		[1] = {
			[1] = {
				[1] = "\18",
				[2] = "wood_sword",
				[3] = nil,
				[4] = Vector3.new(-0.6882433295249939, -5.313460338385312e-09, -0.7254799008369446),
				[5] = {
					[1] = nil,
					[2] = nil,
					[3] = nil,
					[4] = nil,
					[5] = nil,
					[6] = nil,
					[7] = nil,
					[8] = nil,
					[9] = nil,
					[10] = nil,
					[11] = nil,
					[12] = game:GetService("Players").LocalPlayer.Character.LeftLowerLeg,
					[13] = game:GetService("Players").LocalPlayer.Character.LeftFoot,
					[14] = game:GetService("Players").LocalPlayer.Character.RightFoot,
					[15] = game:GetService("Players").LocalPlayer.Character.RightLowerLeg,
					[16] = game:GetService("Players").LocalPlayer.Character.RightUpperLeg,
					[17] = game:GetService("Players").LocalPlayer.Character.LeftUpperLeg,
					[18] = game:GetService("Players").LocalPlayer.Character.LeftHand,
					[19] = game:GetService("Players").LocalPlayer.Character.LeftLowerArm,
					[20] = game:GetService("Players").LocalPlayer.Character.LowerTorso,
					[21] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
					[22] = game:GetService("Players").LocalPlayer.Character.UpperTorso,
					[23] = game:GetService("Players").LocalPlayer.Character.RightLowerArm,
					[24] = game:GetService("Players").LocalPlayer.Character.wood_sword.Handle,
					[25] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[26] = game:GetService("Players").LocalPlayer.Character.RightUpperArm,
					[27] = game:GetService("Players").LocalPlayer.Character.LeftUpperArm,
					[28] = nil,
					[29] = game:GetService("Players").LocalPlayer.Character.RightHand,
					[30] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[31] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[32] = game:GetService("Players").LocalPlayer.Character.Head,
					[33] = nil
				}
			}
		}
	}

	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	end

	end
	else
		_G.InstaKillExploit = false

	while _G.InstaKillExploit do wait()

	if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("wood_sword") then
	local args = {
		[1] = {
			[1] = {
				[1] = "\18",
				[2] = "wood_sword",
				[3] = nil,
				[4] = Vector3.new(-0.6882433295249939, -5.313460338385312e-09, -0.7254799008369446),
				[5] = {
					[1] = nil,
					[2] = nil,
					[3] = nil,
					[4] = nil,
					[5] = nil,
					[6] = nil,
					[7] = nil,
					[8] = nil,
					[9] = nil,
					[10] = nil,
					[11] = nil,
					[12] = game:GetService("Players").LocalPlayer.Character.LeftLowerLeg,
					[13] = game:GetService("Players").LocalPlayer.Character.LeftFoot,
					[14] = game:GetService("Players").LocalPlayer.Character.RightFoot,
					[15] = game:GetService("Players").LocalPlayer.Character.RightLowerLeg,
					[16] = game:GetService("Players").LocalPlayer.Character.RightUpperLeg,
					[17] = game:GetService("Players").LocalPlayer.Character.LeftUpperLeg,
					[18] = game:GetService("Players").LocalPlayer.Character.LeftHand,
					[19] = game:GetService("Players").LocalPlayer.Character.LeftLowerArm,
					[20] = game:GetService("Players").LocalPlayer.Character.LowerTorso,
					[21] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
					[22] = game:GetService("Players").LocalPlayer.Character.UpperTorso,
					[23] = game:GetService("Players").LocalPlayer.Character.RightLowerArm,
					[24] = game:GetService("Players").LocalPlayer.Character.wood_sword.Handle,
					[25] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[26] = game:GetService("Players").LocalPlayer.Character.RightUpperArm,
					[27] = game:GetService("Players").LocalPlayer.Character.LeftUpperArm,
					[28] = nil,
					[29] = game:GetService("Players").LocalPlayer.Character.RightHand,
					[30] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[31] = game:GetService("Players").LocalPlayer.Character.wood_sword.SwordPart,
					[32] = game:GetService("Players").LocalPlayer.Character.Head,
					[33] = workspace.PlacedItems.UnseperatedMap.concrete.concrete
				}
			}
		}
	}

	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	end

	end
	end
	end,
})

local Speed = windowapi.CreateButton({
	["Name"] = "Speed",
	["Tab"] = "Movement",
	 --]]
	["Function"] = function(callback)
	if callback then
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
	else
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	end
	end,
})

local Flight = windowapi.CreateButton({
	["Name"] = "Flight",
	["Tab"] = "Movement",
	 --]]
	["Function"] = function(callback)
	if callback then
	workspace.Gravity = 0
	else
		workspace.Gravity = 196.2
	end
	end,
})

local FunnyFly = windowapi.CreateButton({
	["Name"] = "FunnyFly",
	["Tab"] = "Movement",
	 --]]
	["Function"] = function(callback)
	if callback then
	_G.Velo = true

	while _G.Velo do
	game.Players.LocalPlayer.character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
	wait(0.2)
	end
	else
		_G.Velo = false

	while _G.Velo do
	game.Players.LocalPlayer.character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
	wait(0.2)
	end
	end
	end,
})

local AntivoidEnabled = nil
local AntiVoid = windowapi.CreateButton({
	["Name"] = "AntiVoid",
	["Tab"] = "Utility",
	
	["Function"] = function(callback)
	if callback then
	AntivoidEnabled = true
	repeat wait()
	if lplr.Character.HumanoidRootPart.Position.Y < 1 then
	local e = Instance.new("BodyVelocity",lplr.Character.HumanoidRootPart)
	workspace.Gravity = 0
	e.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X,130,lplr.Character.HumanoidRootPart.Velocity.Z)
	task.wait(0.5)
	e:Destroy()
	workspace.Gravity = 196.2
	end
	until not AntivoidEnabled
	else
		AntivoidEnabled = false
	end
	end,
})

AutoToxicEnabled = nil
local AutoToxic = windowapi.CreateButton({
	["Name"] = "AutoToxic",
	["Tab"] = "Utility",
	
	["Function"] = function(callback)
	if callback then
	AutoToxicEnabled = true
	repeat task.wait(3)
	for _,v in pairs(game.Players:GetPlayers()) do
	if v.Character.Humanoid.Health == 0 then
	local pick = math.random(1,3)
	if pick == 1 then
	chat("L"..v.Name.." Looks like you forgot to get moon.")
	elseif pick == 2 then
	chat(v.Name.." do you eat losses for breakfast?")
	elseif pick == 3 then
	chat("Moon is sponsored by edp445, "..v.Name.." L.")
	end
	end
	end
	until not AutoToxicEnabled
	else
		AutoToxicEnabled = false
	end
	end,
})

local Nuker = windowapi.CreateButton({
	["Name"] = "Nuker",
	["Tab"] = "Utility",
	
	["Function"] = function(callback)
	if callback then
	AutoToxicEnabled = true
	repeat task.wait(0.1)
	for _,v in pairs(workspace.PlacedItems:GetChildren()) do
	if v.Name == "bed" then
	local args = {
		[1] = {
			[1] = {
				[1] = "\11",
				[2] = "wooden_pickaxe",

				[3] = v
			}
		}
	}

	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	end
	end
	until not AutoToxicEnabled
	else
		AutoToxicEnabled = false
	end
	end,
})

local betterNuker = windowapi.CreateButton({
	["Name"] = "MegaNuker",
	["Tab"] = "Utility",
	["bind"] = nil
	["Function"] = function(callback)
	if callback then
	AutoToxicEnabled = true
	repeat task.wait(0.1)
	for _,v in pairs(workspace.PlacedItems:GetChildren()) do
	local args = {
		[1] = {
			[1] = {
				[1] = "\11",
				[2] = "wooden_pickaxe",

				[3] = v
			}
		}
	}

	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	end
	until not AutoToxicEnabled
	else
		AutoToxicEnabled = false
	end
	end,
})

function AddTag(plr, tag, color)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Plr = plr
local ChatTag = {}
ChatTag[Plr] =
{
	TagText = tag, --Text
	TagColor = color, --Rgb
	NameColor = color
}



local oldchanneltab
local oldchannelfunc
local oldchanneltabs = {}

--// Chat Listener
for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
if
	v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
then
oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
local tab = oldchannelfunc(Self, Name)
if tab and tab.AddMessageToChannel then
local addmessage = tab.AddMessageToChannel
if oldchanneltabs[tab] == nil then
oldchanneltabs[tab] = tab.AddMessageToChannel
end
tab.AddMessageToChannel = function(Self2, MessageData)
if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
if ChatTag[Players[MessageData.FromSpeaker].Name] then
MessageData.ExtraData = {
	NameColor = ChatTag[Players[MessageData.FromSpeaker].Name].NameColor or Players[MessageData.FromSpeaker].TeamColor.Color,
	Tags = {
		table.unpack(MessageData.ExtraData.Tags),
		{
			TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
			TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
		},
	},
}
end
end
return addmessage(Self2, MessageData)
end
end
return tab
end
end
end
end

AddTag("IamNotHamza_GG","Moon Owner", Color3.fromRGB(255, 0, 0))
AddTag("mymomisstinky5333","Moon Beta", Color3.fromRGB(77, 255, 0))
AddTag("HugeAcImprovements","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("thisaccountajokeIS","Head Moon Dev", Color3.fromRGB(77, 255, 0))
AddTag("PrismUserz","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("Monia_9266","NightBed Owner", Color3.fromRGB(77, 255, 0))
AddTag("noboline_w","NightBed Owner", Color3.fromRGB(77, 255, 0))
