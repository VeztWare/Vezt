local executiontime = tick()

repeat task.wait() until game:IsLoaded()

if isfile("ClientName.lua") then
	getgenv().ClientName = readfile("ClientName.lua")
else
	getgenv().ClientName = "Prism Cracked By Piston"
end

local watermarkgui = Instance.new("ScreenGui", gethui and gethui() or game.CoreGui)
getgenv().Array = false
getgenv().Uninjected = false
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/NewUILibrary.lua", true))()
local Notifications = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/Notifications.lua", true))()
getgenv().notifs = Notifications
local SwordAnimations = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/SwordAnimations.lua", true))()
local Chat = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/chatthingy.lua", true))()
local ArrayList = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/Arraylist.lua", true))()

if not isfolder("PrismCracked") then
	makefolder("PrismCracked")
end

if not isfile("PrismCracked/Scripts.lua") then
	writefile("PrismCracked/Scripts.lua",scriptExample)
end

local player = game.Players.LocalPlayer

local Utilities
local Bedwars
local KillauraRemote
local Chests

if workspace:FindFirstChild"Map" then
	Utilities = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/Utilities.lua", true))()
	Bedwars = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheMagicPiston/PrismCracked/main/Bedwars.lua", true))()
	Chests = Utilities.GetChests()
	KillauraRemote = Bedwars.AttackRemote
end

local Combat = UILibrary.MakeTab"Combat"
local Movement = UILibrary.MakeTab"Movement"
local Player = UILibrary.MakeTab"Player"
local World = UILibrary.MakeTab"World"
local Visual = UILibrary.MakeTab"Visuals"
local Scripts = UILibrary.MakeTab"Scripts"

local Client = require(game:GetService"ReplicatedStorage".TS.remotes).default.Client
local UIS = game:GetService"UserInputService"
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local sprinttable = KnitClient.Controllers.SprintController

function getcloserpos(pos1, pos2, amount)
	local newPos = (pos2 - pos1).Unit * math.min(amount, (pos2 - pos1).Magnitude) + pos1
	return newPos
end

local Scripting = {
	ImportScript = function(MN,F,DDs,D)
		UILibrary.MakeModule{
			Name = MN,
			Tab = Scripts,
			Bind = nil,
			Enabled = false,
			Function = F,
			Dropdowns = DDs,
			Description = D,
		}
	end
}

getgenv().AstralScript = Scripting

if game.Players.LocalPlayer.Character.PrimaryPart.Position.Y > 140 and not game.Workspace:FindFirstChild("spawn_cage") then
	Notifications.Notify("Prism","Script will load when game started",3.45,HUDColor)
end

repeat
	task.wait(2)
until game.Players.LocalPlayer.Character.PrimaryPart.Position.Y < 140 or game.Workspace:FindFirstChild("spawn_cage")

task.spawn(function()
	repeat
		task.wait(3)
		writefile("ClientName.lua",tostring(ClientName))
	until true == false
end)

local file = readfile("PrismCracked/Scripts.lua")
if workspace:FindFirstChild("Map") then
    loadstring(file)()
end

UILibrary.MakeModule{
	Name = "Antivoid",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		task.spawn(function()
			task.wait(1)
			Module.AntivoidPart.Touched:Connect(function(hit)
				if hit.Parent.Name == game.Players.LocalPlayer.Character.Name then
					for i = 1, math.round(Dropdowns.Jumps[5]) do
						game.Players.LocalPlayer.Character.Humanoid:ChangeState"Jumping"
						task.wait(0.1)
					end
				end
			end)
		end)
		repeat
			task.wait()
			if Module.AntivoidPart then
				Module.AntivoidPart.Color = getgenv().HUDColor
				Module.AntivoidPart.Transparency = Dropdowns.Transparency[5] / 100
				Module.AntivoidPart.Position = Vector3.new(100, 25 - Dropdowns.LowerY[5], 100)
			else
				local AntiPart = Instance.new("Part", workspace)
				AntiPart.Size = Vector3.new(1.999e3, 1, 1.999e3)
				AntiPart.Anchored = true
				AntiPart.Material = Enum.Material.Neon
				AntiPart.Position = Vector3.new(100, 25 - Dropdowns.LowerY[5], 100)
				Module.AntivoidPart = AntiPart
			end
		until Module.Enabled == false or Uninjected == true
		Module.AntivoidPart:Destroy()
		Module.AntivoidPart = nil
	end,
	Dropdowns = {
		LowerY = {
			"Slider",
			-- Type
			"Lower_Y",
			-- Name
			0,
			-- Min value
			20,
			-- Max value
			0
			-- Current value
		},
		Jumps = {
			"Slider",
			-- Type
			"Jump_Amount",
			-- Name
			1,
			-- Min value
			5,
			-- Max value
			3
			-- Current value
		},
		Transparency = {
			"Slider",
			-- Type
			"Transparency",
			-- Name
			0,
			-- Min value
			100,
			-- Max value
			0
			-- Current value
		},
		AntivoidMode = {
			"Selection",
			-- Type
			"Antivoid_Mode",
			-- Name
			1,
			-- current
			{ "Jump_Bounce", "Velo_Bounce" }
			-- options
		}
	},
	Description = "Various Antivoid methods to bypass the Heatseeker anticheat",
	AntivoidPart = nil
}

UILibrary.MakeModule{
	Name = "Autopot",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local inventory =  game.Players.LocalPlayer.Character:WaitForChild("InventoryFolder").Value
		local EatConnection = inventory.ChildAdded:Connect(function(NewItem)
			if string.find(string.lower(NewItem.Name),"pot") then
				Bedwars.Eat:CallServerAsync({["item"] = NewItem})
			end
		end)
		repeat task.wait(1) until Module.Enabled == false or Uninjected == true
		EatConnection:Disconnect()
	end,
	Dropdowns = {},
	Description = "Automatically uses potions",
	AntivoidPart = nil
}

UILibrary.MakeModule{
	Name = "AutoConsume",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local inventory =  game.Players.LocalPlayer.Character:WaitForChild("InventoryFolder").Value
		local EatConnection = inventory.ChildAdded:Connect(function(NewItem)
			if string.find(string.lower(NewItem.Name),"cone") or string.find(string.lower(NewItem.Name),"pie") then
				Bedwars.Eat:CallServerAsync({["item"] = NewItem})
			end
			if string.find(string.lower(NewItem.Name),"app") then
				task.spawn(function()
					repeat
						task.wait()
					until game.Players.LocalPlayer.Character.Humanoid.Health <= Dropdowns.AutoEatHeal[5]
					Bedwars.Eat:CallServerAsync({["item"] = NewItem})
				end)
			end
		end)
		repeat task.wait(1) until Module.Enabled == false or Uninjected == true
		EatConnection:Disconnect()
	end,
	Dropdowns = {
		AutoEatHeal = {
			"Slider",
			-- Type
			"AutoHealThreshold",
			-- Name
			0,
			-- Min value
			100,
			-- Max value
			35
			-- Current value
		},
	},
	Description = "Automatically consumes items",
	AntivoidPart = nil
}

UILibrary.MakeModule{
	Name = "Step",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		repeat
			task.wait()
			local Player = game.Players.LocalPlayer
			local HRP = Player.Character.HumanoidRootPart
			local Lenght = 2
			local Ray = Ray.new(HRP.Position, HRP.CFrame.LookVector * Lenght)
			local Wall, HitPosition, Normal, Material = workspace:FindPartOnRay(Ray, Player.Character)
			if Wall and Wall.CanCollide == true then
				if UIS:IsKeyDown"W" then HRP.Velocity = Vector3.new(0, 45, 0)
			else
				HRP.Velocity = Vector3.new(0, 0.75, 0) end
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {},
	Description = "Climb walls",
	AntivoidPart = nil
}

UILibrary.MakeModule{
	Name = "Phase",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.PhaseMode[3] == 2 then
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame - Vector3.new(0, 5.3, 0)
			Module.Enabled = false
		end
	end,
	Dropdowns = {
		PhaseMode = {
			"Selection",
			-- Type
			"Phase_Mode",
			-- Name
			1,
			-- current
			{ "Vanilla", "VClip" }
			-- options
		}
	},
	Description = "Clips through walls/floors (Vanilla clip mode is currently broken)"
}

UILibrary.MakeModule{
	Name = "HideNameTags",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		repeat
			for i,v in pairs(game.Players:GetChildren()) do
				if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("Nametag") then
					v.Character.Head.Nametag:Destroy()
				end
			end
			task.wait(1)
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {
		HideSelfTag = {
			"Toggle",-- Type
			"HideSelfTag",-- Name
			true-- CurrentValue
		},
	},
	Description = "Deletes the nametags above player's heads"
}

UILibrary.MakeModule{
	Name = "Chams",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local Chams = {}
		repeat
			task.wait(2.5)
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Character and Utilities.IsAlive(v.Character) and not v.Character:FindFirstChild("Highlight") then
					local Highlight = Instance.new("Highlight",v.Character)
					table.insert(Chams,Highlight)
					task.spawn(function()
						repeat
							task.wait()
							Highlight.FillTransparency = Dropdowns.FillTransparency[5] / 100
							if Dropdowns.TeamColor[3] == false and Utilities.IsAlive(v.Character) and v.Team and v.Team.TeamColor then
								Highlight.FillColor = HUDColor
							else
								Highlight.FillColor = v.Team.TeamColor.Color
							end
							Highlight.OutlineTransparency = Dropdowns.ChamsOutlineTransparency[5]/100
							if Dropdowns.OutlinesMatchFillColor[3] == true then
								Highlight.OutlineColor = HUDColor
							else
								Highlight.OutlineColor = Color3.fromRGB(255,255,255)
							end
						until not v.Character or not Utilities.IsAlive(v.Character)
					end)
				end
			end
		until Module.Enabled == false or Uninjected == true
		for i,v in pairs(Chams) do
			v:Destroy()
		end
	end,
	Dropdowns = {
		ChamsOutlineTransparency = {
			"Slider",
			-- Type
			"ChamsOutlineTransparencyPercent",
			-- Name
			0,
			-- Min value
			100,
			-- Max value
			100
			-- Current value
		},
		FillTransparency = {
			"Slider",
			-- Type
			"FillTransparency",
			-- Name
			0,
			-- Min value
			100,
			-- Max value
			45,
			-- Current value
		},
		OutlinesMatchFillColor = {
			"Toggle",-- Type
			"OutlinesMatchFillColor",-- Name
			false-- CurrentValue
		},
		TeamColor = {
			"Toggle",-- Type
			"TeamColor",-- Name
			true-- CurrentValue
		},
	},
	Description = "shows a players character through walls"
}

UILibrary.MakeModule{
	Name = "ArrayList",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		getgenv().Array = true
		repeat
			task.wait()
			getgenv().ArraylistStrokeTransparency = Dropdowns.StrokeTransparency[5]/10
		until Module.Enabled == false or Uninjected == true
		getgenv().Array = false
	end,
	Dropdowns = {
		StrokeTransparency = {
			"Slider",
			-- Type
			"StrokeTransparency",
			-- Name
			0,
			-- Min value
			10,
			-- Max value
			6
			-- Current value
		},
		SideBar = {
			"Toggle",-- Type
			"SideBar",-- Name
			true-- CurrentValue
		}
	},
	Description = "Array list, displays module info"
}

UILibrary.MakeModule{
	Name = "Uninject",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		Module.Enabled = false
		task.wait(.5)
		Uninjected = true
	end,
	Dropdowns = {},
	Description = "Uninjects astral from the game"
}

UILibrary.MakeModule{
	Name = "XPGrinder",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		task.wait(10)
		local Time = Dropdowns.Timer[5]
		for i = 1,math.round(Time) do
			task.wait(1.05)
		end
		if Module.Enabled == true then
			local tpdata = game:GetService"TeleportService":GetLocalPlayerTeleportData()
			game:GetService"ReplicatedStorage"["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].joinQueue:FireServer{["queueType"] = tpdata.match.queueType}
			task.wait(4.5)
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
		end
	end,
	Dropdowns = {
		Timer = {
			"Slider",
			-- Type
			"Timer",
			-- Name
			15,
			-- Min value
			300,
			-- Max value
			35
			-- Current value
		},
	},
	Description = "Auto grinds xp (recommended in skywars)"
}

UILibrary.MakeModule{
	Name = "AutoQueue",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local Autoqueue = game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(a)
			if a.Name == "spectate-selector" or a.Name == "PostGame" then
				local tpdata = game:GetService"TeleportService":GetLocalPlayerTeleportData()
				game:GetService"ReplicatedStorage"["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].joinQueue:FireServer{ ["queueType"] = tpdata.match.queueType }
			end
		end)
		repeat task.wait(1) until Module.Enabled == false or Uninjected == true
		Autoqueue:Disconnect()
	end,
	Dropdowns = {},
	Description = "Autoqueues to next game"
}

UILibrary.MakeModule{
	Name = "Nuker",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local raycastParams = RaycastParams.new()
		raycastParams.IgnoreWater = true

		GetBeds = function()
			beds = {}
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "bed" and v.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
					table.insert(beds,v)
				end
			end
			return beds
		end

		local Damage = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock

		MainNuker = function(bed)
			local part = bed
			local raycastResult = workspace:Raycast(part.Position + Vector3.new(0,24,0), Vector3.new(0,-27,0), raycastParams)

			if raycastResult then
				local TargetBlock = raycastResult.Instance
				print(TargetBlock.Name,"Nuker output")
				for i,v in pairs(TargetBlock:GetChildren()) do
					if v:IsA("Texture") then
						v:Destroy()
					end
				end
				TargetBlock.Color = HUDColor
				TargetBlock.Material = "Neon"
				Damage:InvokeServer({
					["blockRef"] = {
						["blockPosition"] = Vector3.new(math.round(TargetBlock.Position.X/3),math.round(TargetBlock.Position.Y/3),math.round(TargetBlock.Position.Z/3))
					},
					["hitPosition"] = Vector3.new(math.round(TargetBlock.Position.X/3),math.round(TargetBlock.Position.Y/3),math.round(TargetBlock.Position.Z/3)),
					["hitNormal"] = Vector3.new(math.round(TargetBlock.Position.X/3),math.round(TargetBlock.Position.Y/3),math.round(TargetBlock.Position.Z/3))
				})
			end
		end

		repeat
			task.wait(.25)
			local Beds = GetBeds()
			for i,v in pairs(Beds) do
				if Utilities.IsAlive(game.Players.LocalPlayer.Character) then
					if (v.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude < 28.5 then
						MainNuker(v)
					end
				end
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {},
	Description = "Automatically breaks nearby beds"
}

UILibrary.MakeModule{
	Name = "SlowAutowin",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(0,999,0)
		game.Players.LocalPlayer.Character.PrimaryPart:Destroy()
		game.Players.LocalPlayer.Character.Head.Anchored = true
		game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(a)
			if a.Name == "spectate-selector" or a.Name == "PostGame" and Modules.AutoPlayAgain.Status == true then
				local tpdata = game:GetService"TeleportService":GetLocalPlayerTeleportData()
				game:GetService"ReplicatedStorage"["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].joinQueue:FireServer{ ["queueType"] = tpdata.match.queueType }
			end
		end)
	end,
	Dropdowns = {},
	Description = "Slowest autowin on the planet"
}
UILibrary.MakeModule{
	Name = "Autobank",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		shops = {}
		for i,v in pairs(workspace:GetChildren()) do
			if string.find(v.Name,"shop") then
				table.insert(shops,v)
			end
		end
		SaveItems = function()
			if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder") then
				local Inventory = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder").Value
				for i,v in pairs(Inventory:GetChildren()) do
					if v.Name == "iron" or v.Name == "emerald" or v.Name == "diamond" then
						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["Inventory:ChestGiveItem"]:InvokeServer(Inventory.Parent:FindFirstChild(game.Players.LocalPlayer.Name.."_personal"),v)
					end
				end
			end
		end

		WithdrawItems = function()
			if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder") then
				local Inventory = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder").Value
				for i,v in pairs(Inventory.Parent:FindFirstChild(game.Players.LocalPlayer.Name.."_personal"):GetChildren()) do
					if v.Name == "iron" or v.Name == "emerald" or v.Name == "diamond" then
						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["Inventory:ChestGetItem"]:InvokeServer(Inventory.Parent:FindFirstChild(game.Players.LocalPlayer.Name.."_personal"),v)
					end
				end
			end
		end

		repeat
			task.wait(.25)
			local Deposit = true
			for i,v in pairs(shops) do
				if (v.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude < 20 then
					Deposit = false
				end
			end
			if Deposit == true then
				SaveItems()
			else
				WithdrawItems()
			end
		until Module.Enabled == false or Uninjected == true
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder") then
			local Inventory = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder").Value
			for i,v in pairs(Inventory.Parent:FindFirstChild(game.Players.LocalPlayer.Name.."_personal"):GetChildren()) do
				if v.Name == "iron" or v.Name == "emerald" or v.Name == "diamond" then
					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["Inventory:ChestGetItem"]:InvokeServer(Inventory.Parent:FindFirstChild(game.Players.LocalPlayer.Name.."_personal"),v)
				end
			end
		end
	end,
	Dropdowns = {},
	Description = "Automatically stores items in enderchest until you are near a shop",
	AntivoidPart = nil
}

UILibrary.MakeModule{
	Name = "Lighting",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local TempAssets = {}
		if Dropdowns.Mode[3] == 6 then
			game.Lighting.Ambient = Color3.fromRGB(170, 0, 255)
			local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
			tint.TintColor = Color3.fromRGB(225, 200, 255)
			local newsky = Instance.new("Sky", game.Lighting)
			newsky.SkyboxBk = "rbxassetid://8539982183"
			newsky.SkyboxDn = "rbxassetid://8539981943"
			newsky.SkyboxFt = "rbxassetid://8539981721"
			newsky.SkyboxLf = "rbxassetid://8539981424"
			newsky.SkyboxRt = "rbxassetid://8539980766"
			newsky.SkyboxUp = "rbxassetid://8539981085"
			newsky.MoonAngularSize = 0
			newsky.SunAngularSize = 0
			newsky.StarCount = 3e3
			table.insert(TempAssets, newsky)
			table.insert(TempAssets, tint)
		elseif Dropdowns.Mode[3] == 1 then
			game.Lighting.ClockTime = 13.5
			game.Lighting.Brightness = 3
			game.Lighting.ExposureCompensation = 0.2
			local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
			tint.TintColor = Color3.fromRGB(240, 240, 255)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 200)
			table.insert(TempAssets, tint)
		elseif Dropdowns.Mode[3] == 2 then
			game.Lighting.ClockTime = 1.5
			game.Lighting.Brightness = 3
			game.Lighting.ExposureCompensation = 0.2
			local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
			tint.TintColor = Color3.fromRGB(240, 240, 255)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 200)
			table.insert(TempAssets, tint)
		elseif Dropdowns.Mode[3] == 3 then
			game.Lighting.ClockTime = Dropdowns.Time[5]
			game.Lighting.Brightness = 3
			game.Lighting.ExposureCompensation = 0.2
			local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
			tint.TintColor = Color3.fromRGB(Dropdowns.Red[5], Dropdowns.Green[5], Dropdowns.Blue[5])
			game.Lighting.OutdoorAmbient = Color3.fromRGB(Dropdowns.Red[5], Dropdowns.Green[5], Dropdowns.Blue[5])
			table.insert(TempAssets, tint)
		elseif Dropdowns.Mode[3] == 7 then
			game.Lighting.Ambient = Color3.fromRGB(253, 234, 141)
			local tint = Instance.new("ColorCorrectionEffect", game.Lighting)
			tint.TintColor = Color3.fromRGB(225, 200, 255)
			local newsky = Instance.new("Sky", game.Lighting)
			newsky.SkyboxBk = "rbxassetid://2672324007"
			newsky.SkyboxDn = "rbxassetid://2672324211"
			newsky.SkyboxFt = "rbxassetid://2672324150"
			newsky.SkyboxLf = "rbxassetid://2672324084"
			newsky.SkyboxRt = "rbxassetid://2672323855"
			newsky.SkyboxUp = "rbxassetid://2672323937"
			newsky.MoonAngularSize = 0
			newsky.SunAngularSize = 15
			newsky.StarCount = 3e3
			table.insert(TempAssets, newsky)
			table.insert(TempAssets, tint)
		end
		repeat task.wait() until Module.Enabled == false or Uninjected == true
		game.Lighting.ExposureCompensation = 0
		game.Lighting.ClockTime = 11.5
		game.Lighting.Brightness = 1
		for i, v in pairs(TempAssets) do v:Destroy() end
		game.Lighting.Ambient = Color3.fromRGB(165, 165, 165)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(130, 120, 105)
	end,
	Dropdowns = {
		Time = {
			"Slider",
			-- Type
			"Time",
			-- Name
			0,
			-- Min value
			24,
			-- Max value
			12
			-- Current value
		},
		Red = {
			"Slider",
			-- Type
			"Red",
			-- Name
			0,
			-- Min value
			255,
			-- Max value
			255
			-- Current value
		},
		Blue = {
			"Slider",
			-- Type
			"Blue",
			-- Name
			0,
			-- Min value
			255,
			-- Max value
			255
			-- Current value
		},
		Green = {
			"Slider",
			-- Type
			"Green",
			-- Name
			0,
			-- Min value
			255,
			-- Max value
			255
			-- Current value
		},
		Mode = {
			"Selection",
			-- Type
			"Mode",
			-- Name
			1,
			-- current
			{
				"Prism_Day",
				"Prism_Night",
				"Custom",
				"Blood_Moon",
				"Atlantis",
				"Void",
				"Autumn"
			}
			-- options
		}
	},
	Description = "Change the lighting in the game"
}
UILibrary.MakeModule{
	Name = "Multiaura",
	Tab = Combat,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local Target
		repeat
			task.spawn(function()
				if Utilities.IsAlive(game.Players.LocalPlayer.Character) then
					local Nearby = Utilities.GetNearbyPlayers(18, false)
					for i, v in pairs(Nearby) do
						if Utilities.IsAlive(v.Character) and v.Team ~= game.Players.LocalPlayer.Team then Target = v end
					end
					task.spawn(function()
						if Target and Utilities.IsAlive(Target.Character) then
							task.spawn(function()
								local self = getcloserpos(game.Players.LocalPlayer.Character.PrimaryPart.Position, Target.Character.PrimaryPart.Position, 4)
								local npos = Target.Character.PrimaryPart.Position
								if Target.Character and Target.Character.PrimaryPart then
									Bedwars.PaintRemote:SendToServer(self, CFrame.lookAt(self, npos).lookVector)
								end
							end)
						end
					end)
				end
			end)
			if math.random(1,5) == 1 then
				task.wait()
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {},
	Description = "Multi aura idk"
}

UILibrary.MakeModule{
	Name = "AutoSkywars",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local spawncage = workspace:FindFirstChild("spawn_cage")
		if spawncage then
			Notifications.Notify("Auto-Skywars","Phased out of cage succesfully",3.5,getgenv().HUDColor)
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame * CFrame.new(0,-6.5,0)
		end
	end,
	Dropdowns = {
		Autophase = {
			"Toggle",-- Type
			"Autophase",-- Name
			true-- CurrentValue
		}
	},
	Description = "Automatically does actions in skywars"
}

UILibrary.MakeModule{
	Name = "NoFall",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.NofallMode[3] == 1 then
			Bedwars.GroundHit:FireServer(workspace.Map, math.random(2, 4) * (math.random(1, 100) * 0.01))
		elseif Dropdowns.NofallMode[3] == 2 then
			repeat
				task.wait()
				task.spawn(function()
					if Utilities.IsAlive(player.Character) and player.Character.PrimaryPart.Velocity.Y < -90 then
						player.Character.PrimaryPart.Velocity = player.Character.PrimaryPart.Velocity + Vector3.new(0, 45.6, 0)
					end
				end)
			until Dropdowns.NofallMode[3] ~= 2 or Module.Enabled == false or Uninjected == true
		elseif Dropdowns.NofallMode[3] == 3 then
			repeat
				task.wait()
				task.spawn(function()
					if Utilities.IsAlive(player.Character) and player.Character.PrimaryPart.Velocity.Y < -100 then
						player.Character.PrimaryPart.Velocity = player.Character.PrimaryPart.Velocity + Vector3.new(0, 80, 0)
					end
				end)
			until Dropdowns.NofallMode[3] ~= 3 or Module.Enabled == false or Uninjected == true
		elseif Dropdowns.NofallMode[3] == 4 then
			repeat
				task.wait()
				task.spawn(function()
					if Utilities.IsAlive(player.Character) and player.Character.PrimaryPart.Velocity.Y < -40 then
						player.Character.PrimaryPart.Velocity = player.Character.PrimaryPart.Velocity + Vector3.new(0, 30, 0)
					end
				end)
			until Dropdowns.NofallMode[3] ~= 4 or Module.Enabled == false or Uninjected == true
		end
	end,
	Dropdowns = {
		NofallMode = {
			"Selection",
			-- Type
			"NoFall_Mode",
			-- Name
			1,
			-- current
			{
				"Remote_Exploit",
				"NoFall_1",
				"NoFall_2",
				"NoFall_3"
			}
			-- options
		}
	},
	Description = "Various nofall methods to bypass anticheats"
}
UILibrary.MakeModule{
	Name = "HUD",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local HUDWaterMark = Instance.new("Frame", watermarkgui)
		HUDWaterMark.Size = UDim2.new(0.2, 0, 0.04, 0)
		HUDWaterMark.Position = UDim2.new(0.005, 0, 0.005, 0)
		if Dropdowns.WaterMarkMode[3] == 1 then
			HUDWaterMark.BackgroundTransparency = 1
			local Text = Instance.new("TextLabel", HUDWaterMark)
			Text.Size = UDim2.new(1, 0, 1, 0)
			Text.TextSize = Text.AbsoluteSize.X * 0.05
			Text.TextXAlignment = "Left"
			Text.BackgroundTransparency = 1
			HUDWaterMark.BackgroundTransparency = 1
			task.spawn(function()
				local fpsUpdate = false
				local fps
				repeat
					local str = getgenv().ClientName
					local first = string.sub(str, 1, 1)
					local second = str:sub(2)
					task.wait()
					task.spawn(function()
						if fpsUpdate == false then
							fpsUpdate = true
							fps = math.round(1 / game:GetService("RunService").RenderStepped:Wait())
							task.wait(.5)
							fpsUpdate = false
						end
					end)
					if Dropdowns.ShowFPS[3] == true then
						Text.Text = str.." ["..fps.." FPS]"
					else
						Text.Text = str
					end
				until not Text
			end)
			Text.TextColor3 = Color3.fromRGB(225, 225, 225)
		elseif Dropdowns.WaterMarkMode[3] == 2 then
			HUDWaterMark.Position = UDim2.new(0, 0, 0.01, 0)
			HUDWaterMark.BackgroundTransparency = 1
			local Text1 = Instance.new("TextLabel", HUDWaterMark)
			local Text2 = Instance.new("TextLabel", HUDWaterMark)
			Text1.Size = UDim2.new(0.113, 0, 1, 0)
			Text1.Position = UDim2.new(0, 0, 0.5, 0)
			Text1.AnchorPoint = Vector2.new(0, 0.5)
			Text1.BackgroundTransparency = 1
			Text1.TextSize = Text1.AbsoluteSize.X * 0.635
			Text1.TextXAlignment = "Right"
			Text2.Size = UDim2.new(0.889, 0, 1, 0)
			Text2.BackgroundTransparency = 1
			Text2.Position = UDim2.new(0.111, 0, 0.5, 0)
			Text2.TextSize = Text2.AbsoluteSize.X * 0.08
			Text2.AnchorPoint = Vector2.new(0, 0.5)
			Text2.TextColor3 = Color3.fromRGB(225, 225, 225)
			Text2.TextXAlignment = "Left"
			Text2.Font = "Gotham"
			Text1.Font = "Gotham"
			task.spawn(function()
				local fpsUpdate = false
				local fps = 0
				repeat
					local str = getgenv().ClientName
					local first = string.sub(str, 1, 1)
					local second = str:sub(2)
					task.spawn(function()
						if fpsUpdate == false then
							fpsUpdate = true
							fps = math.round(1 / game:GetService("RunService").RenderStepped:Wait())
							task.wait(.5)
							fpsUpdate = false
						end
					end)
					task.wait()
					Text1.Text = first
					if Dropdowns.ShowFPS[3] == true then
						Text2.Text = second.." ["..fps.." FPS]"
					else
						Text2.Text = second
					end
					Text1.TextColor3 = getgenv().HUDColor
				until not Text1
			end)
		elseif Dropdowns.WaterMarkMode[3] == 5 then
			task.spawn(function()

			end)
		end
		repeat
			task.wait()
			if Dropdowns.ColorMode[3] == 1 then
				for i = 1, 100 do
					task.wait(2e-3)
					getgenv().HUDColor = Color3.fromRGB(100 + i, 0, 220 + i / 3)
				end
				for i = 1, 100 do
					task.wait(2e-3)
					getgenv().HUDColor = Color3.fromRGB(200 - i, 0, 253.33 - i / 3)
				end
			elseif Dropdowns.ColorMode[3] == 2 then
				getgenv().HUDColor = Color3.fromRGB(Dropdowns.Red[5], Dropdowns.Green[5], Dropdowns.Blue[5])
			elseif Dropdowns.ColorMode[3] == 3 then
				for i = 1, math.round(Dropdowns.RainbowSpeed[5]) do
					task.wait(0.04)
					getgenv().HUDColor = Color3.fromHSV(i / math.round(Dropdowns.RainbowSpeed[5]), .45, 1)
				end
			elseif Dropdowns.ColorMode[3] == 4 then
				local looped = false
				local red = Color3.fromRGB(255, 102, 104)
				local blue = Color3.fromRGB(235, 123, 255)
				local white = Color3.fromRGB(231, 231, 231)
				local tempobj = Instance.new("Part",game.ReplicatedStorage)
				tempobj.Color = blue
				task.spawn(function()
					repeat
						task.wait()
						getgenv().HUDColor = tempobj.Color
					until looped == true
				end)
				local TweenService = game:GetService("TweenService")
				local partColorTweenInfo = TweenInfo.new(1)
				local tweenPartColor = TweenService:Create(tempobj, partColorTweenInfo, {Color = blue})
				tweenPartColor:Play()
				task.wait(1.1)
				local tweenPartColor = TweenService:Create(tempobj, partColorTweenInfo, {Color = red})
				tweenPartColor:Play()
				task.wait(1.1)
				local tweenPartColor = TweenService:Create(tempobj, partColorTweenInfo, {Color = white})
				tweenPartColor:Play()
				task.wait(1.1)
				local tweenPartColor = TweenService:Create(tempobj, partColorTweenInfo, {Color = blue})
				tweenPartColor:Play()
				task.wait(1.1)
				looped = true
				tempobj:Destroy()
			end
		until Module.Enabled == false or Uninjected == true
		if HUDWaterMark then HUDWaterMark:Destroy() end
	end,
	Dropdowns = {
		Red = {
			"Slider",
			-- Type
			"Static_Red",
			-- Name
			1,
			-- Min value
			255,
			-- Max value
			13
			-- Current value
		},
		Green = {
			"Slider",
			-- Type
			"Static_Green",
			-- Name
			1,
			-- Min value
			255,
			-- Max value
			105
			-- Current value
		},
		Blue = {
			"Slider",
			-- Type
			"Static_Blue",
			-- Name
			1,
			-- Min value
			255,
			-- Max value
			172
			-- Current value
		},
		RainbowSpeed = {
			"Slider",
			-- Type
			"Rainbow_Speed",
			-- Name
			1,
			-- Min value
			100,
			-- Max value
			50
			-- Current value
		},
		ColorMode = {
			"Selection",
			-- Type
			"Color_Mode",
			-- Name
			1,
			-- current
			{ "Astral", "Static", "Rainbow", "Astolfo" }
			-- options
		},
		ShowFPS = {
			"Toggle",
			"ShowFPS",
			true,
		},
		WaterMarkMode = {
			"Selection",-- Type
			"Water_Mark_Mode",-- Name
			1,-- current
			{
				"Text",
				"First_Colored",
				"Colored",
				"CSGO",
				"Minecraft",
				"None"
			}-- options
		},
	},
	Description = "HUD Editor - customize to your liking"
}
local SwingAnimation = Instance.new("Animation",game.Workspace.Map)
SwingAnimation.AnimationId = "rbxassetid://4947108314"

UILibrary.MakeModule{
	Name = "KillAura",
	Tab = Combat,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local ScreenGui
		local Target
		local anims = 0
		local cam = game.Workspace.Camera
		local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
		local up1 = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.06 * 2), {
			C0 = origC0 * CFrame.new(1.29, -0.86, 0.06) * CFrame.Angles(math.rad(-30), math.rad(130), math.rad(60))
		})
		local up2 = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.06 * 2), {
			C0 = origC0 * CFrame.new(1.39, -0.86, 0.26) * CFrame.Angles(math.rad(-10), math.rad(50), math.rad(80))
		})
		local down = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.125 * 2), {
			C0 = origC0 * CFrame.new(1.29, -0.86, 5.06) * CFrame.Angles(math.rad(-30), math.rad(130), math.rad(60))
		})

		local zylaanim1 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.3)), {
			C0 = origC0 * CFrame.new(0.3, -2, 0.5) * CFrame.Angles(-math.rad(190), math.rad(110), -math.rad(90))
		})

		local zylaanim2 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(0.3, -1.5, 1.5) * CFrame.Angles(math.rad(120), math.rad(140), math.rad(320))
		})

		local spinny1 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .5) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0))
		})
		
		local spinny2 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .5) * CFrame.Angles(math.rad(-120), math.rad(0), math.rad(0))
		})
		
		local spinny3 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .5) * CFrame.Angles(math.rad(-180), math.rad(0), math.rad(0))
		})
		
		local spinny4 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .5) * CFrame.Angles(math.rad(-240), math.rad(0), math.rad(0))
		})
		
		local spinny5 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .5) * CFrame.Angles(math.rad(-300), math.rad(0), math.rad(0))
		})
		
		local spinny6 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.1)), {
			C0 = origC0 * CFrame.new(1, -0.5, .6) * CFrame.Angles(math.rad(-360), math.rad(0), math.rad(0))
		})

		task.spawn(function()
			repeat
				task.wait()
				if Dropdowns.Visuals[3] == true then
					if ScreenGui == nil then
						ScreenGui = Instance.new"ScreenGui"
						local Frame = Instance.new"Frame"
						local Frame_2 = Instance.new"Frame"
						local TextLabel = Instance.new"TextLabel"
						local Frame_3 = Instance.new"Frame"
						local Frame_4 = Instance.new"Frame"
						local TextLabel_2 = Instance.new"TextLabel"
						local TextLabel_3 = Instance.new"TextLabel"
						local ViewportFrame = Instance.new"ViewportFrame"
						ScreenGui.Parent = game.CoreGui
						ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						Frame.Parent = ScreenGui
						Frame.AnchorPoint = Vector2.new(0.5, 0.5)
						Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						Frame.BackgroundTransparency = 0.6
						Frame.BorderSizePixel = 0
						Frame.Position = UDim2.new(0.5, 0, 0.766917288, 0)
						Frame.Size = UDim2.new(0, 270, 0, 124)
						Frame_2.Parent = Frame
						Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
						Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						Frame_2.BackgroundTransparency = 0.6
						Frame_2.BorderSizePixel = 0
						Frame_2.Position = UDim2.new(0.5, 0,0.493, 0)
						Frame_2.Size = UDim2.new(0, 254, 0, 27)
						TextLabel.Parent = Frame_2
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1
						TextLabel.Position = UDim2.new(-4.58937883e-3, 0, 5.22103906e-3, 0)
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.ZIndex = 3
						TextLabel.Font = Enum.Font.GothamMedium
						TextLabel.Text = "17.6"
						TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.TextScaled = true
						TextLabel.TextSize = 14
						TextLabel.TextStrokeTransparency = 0
						TextLabel.TextWrapped = true
						Frame_3.Parent = Frame_2
						Frame_3.BackgroundColor3 = Color3.fromRGB(183, 0, 255)
						Frame_3.BorderSizePixel = 0
						Frame_3.Size = UDim2.new(1,0,1,0)
						TextLabel_2.Parent = Frame
						TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_2.BackgroundTransparency = 1
						TextLabel_2.Position = UDim2.new(0.032, 0,0.711, 0)
						TextLabel_2.Size = UDim2.new(0, 254, 0, 23)
						TextLabel_2.Font = Enum.Font.GothamMedium
						TextLabel_2.Text = "72ms"
						TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_2.TextScaled = true
						TextLabel_2.TextSize = 14
						TextLabel_2.TextStrokeTransparency = 0
						TextLabel_2.TextWrapped = true
						TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel_3.Parent = Frame
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.BackgroundTransparency = 1
						TextLabel_3.Position = UDim2.new(0.03, 0, 0.093, 0)
						TextLabel_3.Size = UDim2.new(0, 254, 0, 21)
						TextLabel_3.Font = Enum.Font.GothamMedium
						TextLabel_3.Text = "Player445"
						TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.TextScaled = true
						TextLabel_3.TextSize = 14
						TextLabel_3.TextStrokeTransparency = 0
						TextLabel_3.TextWrapped = true
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
						task.spawn(function()
							repeat
								task.wait()
								task.spawn(function()
									if Utilities.IsAlive(player.Character) and Target and Utilities.IsAlive(Target.Character) and (game.Players.LocalPlayer.Character.PrimaryPart.Position - Target.Character.PrimaryPart.Position).Magnitude < 25 then
										player.Character.Humanoid.Jump = true
										ScreenGui.Enabled = true
										TextLabel_3.Text = Target.Name
										TextLabel.Text = math.round(Target.Character.Humanoid.Health / 5)
										TextLabel_2.Text = math.round(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()).."ms"
										Frame_3.Size = UDim2.new(Target.Character.Humanoid.Health * 0.01, 0, 1, 0)
										Frame_3.BackgroundColor3 = getgenv().HUDColor
									else
										ScreenGui.Enabled = false
									end
								end)
							until not ScreenGui
						end)
					end
				end
				if Target and Utilities.IsAlive(Target.Character) and (game.Players.LocalPlayer.Character.PrimaryPart.Position - Target.Character.PrimaryPart.Position).Magnitude < 25 then
					if Dropdowns.Autoblock[3] == 1 then
						anims = anims + 1
						up1:Play()
						task.wait(0.06 * 2)
						up2:Play()
						task.wait(0.06 * 2)
						if anims == 2 then
							anims = 0
							down:Play()
							task.wait(0.075 * 2)
						end
					elseif Dropdowns.Autoblock[3] == 2 then
						zylaanim1:Play()
						task.wait(.3)
						zylaanim2:Play()
						task.wait(.1)
					elseif Dropdowns.Autoblock[3] == 4 then
						spinny1:Play()
						task.wait(.05)
						spinny2:Play()
						task.wait(.05)
						spinny3:Play()
						task.wait(.05)
						spinny4:Play()
						task.wait(.05)
						spinny5:Play()
						task.wait(.05)
						spinny6:Play()
						task.wait(.05)
					end
				else
					local stop = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.4), { C0 = origC0 })
					stop:Play()
				end
			until Module.Enabled == false
			local stop = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.4), { C0 = origC0 })
			stop:Play()
		end)
		local Delay = false
		local OldVisual
		repeat
			task.spawn(function()
				if Utilities.IsAlive(game.Players.LocalPlayer.Character) then
					local Nearby = Utilities.GetNearbyPlayers(17.5, false)
					for i, v in pairs(Nearby) do
						if Utilities.IsAlive(v.Character) and v.Team ~= game.Players.LocalPlayer.Team then
							Target = v
							if Dropdowns.AutoJump[3] == true and Utilities.IsAlive(player.Character) then
								if Delay == false then
									Delay = true
									player.Character.Humanoid:ChangeState("Jumping")
									task.wait(.5)
									Delay = false
								end
							end
						end
					end
					if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") and Utilities.IsAlive(Target.Character) and Utilities.IsAlive(player.Character) then
						local mouse = Ray.new(cam.CFrame.Position, Target.Character.HumanoidRootPart.Position).Unit.Direction
						local cameraposition = cam.CFrame.Position
							KillauraRemote:FireServer{
								["entityInstance"] = Target.Character,
								["chargedAttack"] = {
									["chargeRatio"] = 1
								},
								["validate"] = {
									["raycast"] = {
										["cursorDirection"] = {
											["value"] = mouse
										},
										["cameraPosition"] = {
											["value"] = cameraposition }
										},
										["selfPosition"] = {
											["value"] = getcloserpos(game.Players.LocalPlayer.Character.PrimaryPart.Position, Target.Character.PrimaryPart.Position, 4)
										},
										["targetPosition"] = {
											["value"] = Utilities.Predict(Target)
										}
									},
								["weapon"] = Utilities.GetBestSword()
							}
						if Dropdowns.Swing[3] == true then
							local Loaded = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(SwingAnimation)
							Loaded:Play()
						end
					end
				end
			end)
			task.wait(.32)
		until Module.Enabled == false or Uninjected == true
		if TargetHUD then
			TargetHUD:Destroy()
			TargetGUI:Destroy()
		end
	end,
	Dropdowns = {
		AuraMode = {
			"Selection",
			-- Type
			"AuraMode",
			-- Name
			1,
			-- current
			{ "Switch", "Single", "Sort" }
			-- options
		},
		SortMode = {
			"Selection",
			-- Type
			"SortMode",
			-- Name
			1,
			-- current
			{ "Health", "Risk", "Weak" }
			-- options
		},
		Autoblock = {
			"Selection",
			-- Type
			"Autoblock",
			-- Name
			1,
			-- current
			{ "Prism", "ZylaAnim", "Basic", "Spinny" }
			-- options
		},
		Swing = {
			"Toggle",
			-- Type
			"Swing",
			-- Name
			true
			-- CurrentValue
		},
		AutoJump = {
			"Toggle",
			-- Type
			"AutoJump",
			-- Name
			true
			-- CurrentValue
		},
		Visuals = {
			"Toggle",
			-- Type
			"Visuals",
			-- Name
			false
			-- CurrentValue
		},
		HitBox = {
			"Toggle",
			-- Type
			"HitBox",
			-- Name
			true
			-- CurrentValue
		},
		ServerPrediction = {
			"Toggle",
			-- Type
			"ServerPrediction",
			-- Name
			true
			-- CurrentValue
		}
	},
	Description = "Automatically attacks nearby players"
}

local flying = false

UILibrary.MakeModule{
	Name = "Flight",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
        getgenv().Flying = true
		if Dropdowns.FlightMode[3] == 2 and flying == false then
			flying = true
			local StartingY = game.Players.LocalPlayer.Character.PrimaryPart.Position.Y
			local FakeCamera = Instance.new("Part",workspace)
			FakeCamera.Anchored = true
			FakeCamera.Size = Vector3.new(3,5,3)
			FakeCamera.Transparency = 0.6
			FakeCamera.CanCollide = false
			FakeCamera.Material = "Neon"
			game.Workspace.Camera.CameraSubject = FakeCamera

			local FakeCamRefresh = game:GetService("RunService").RenderStepped:Connect(function()
				if Utilities.IsAlive(game.Players.LocalPlayer.Character) then
					FakeCamera.Color = getgenv().HUDColor
					FakeCamera.Position = Vector3.new(game.Players.LocalPlayer.Character.PrimaryPart.Position.X,StartingY,game.Players.LocalPlayer.Character.PrimaryPart.Position.Z)
				end
			end)

			game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(game.Players.LocalPlayer.Character.PrimaryPart.Velocity.X,0,game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Z)

			game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			for i = 1,math.round(Dropdowns.ClipAmount[5]) do
				task.wait(.02)
				game.Players.LocalPlayer.Character.PrimaryPart.Velocity = game.Players.LocalPlayer.Character.PrimaryPart.Velocity + Vector3.new(0,9,0)
			end
			task.wait(Dropdowns.ClipAmount[5]/13.5)
			FakeCamRefresh:Disconnect()
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			FakeCamera:Destroy()
		end
		if Dropdowns.FlightMode[3] == 1 then
			local ticks = 1
			repeat
				ticks = ticks + 1
				local VUp = 0.5
				if Dropdowns.Vertical[3] == true then
					if UIS:IsKeyDown(Enum.KeyCode.Space) then VUp = 45 end
					if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then VUp = -45 end
				end
				if Utilities.IsAlive(Utilities.GetCharacter()) then
					Utilities.GetCharacter().PrimaryPart.Velocity = Vector3.new(Utilities.GetCharacter().PrimaryPart.Velocity.X, VUp, Utilities.GetCharacter().PrimaryPart.Velocity.Z)
				end
				task.wait()
			until Module.Enabled == false or Uninjected == true
		end
		if Dropdowns.FlightMode[3] == 3 and Module.Enabled == true then
			local jumped = false
			
			local hori = Dropdowns.DamageSpeed[5] * 1.25
			
			local guid = game:GetService("HttpService"):GenerateGUID()
			if Module.Enabled == true then
				Bedwars.Projectile:CallServerAsync(
					game.Players.LocalPlayer.Character.InventoryFolder.Value.fireball,
					"fireball",
					"fireball",
					game.Players.LocalPlayer.Character.PrimaryPart.CFrame*CFrame.new(0,-3,4).Position,
					game.Players.LocalPlayer.Character.PrimaryPart.Position,
					Vector3.new(0,-20,0),
					guid,
					{
						["drawDurationSeconds"] = 3
					},
					workspace:GetServerTimeNow()
				)
			end
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			getgenv().Flying = true
			local x,z
			repeat
				for i,v in pairs(game.Workspace:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Destroy()
					end
				end
				task.wait()
				if game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Y > 1 then
					jumped = true
					local X = game.Players.LocalPlayer.Character.PrimaryPart.Velocity.X * hori
					local Z = game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Z * hori
					x = X
					z = Z
					game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(X,0,Z)
				end
			until jumped == true
			local ticks = 1
			repeat
				ticks = ticks + 1
				local VUp = 0.5
				if Dropdowns.Vertical[3] == true then
					if UIS:IsKeyDown(Enum.KeyCode.Space) then VUp = 45 end
					if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then VUp = -45 end
				end
				if Utilities.IsAlive(Utilities.GetCharacter()) then
					game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(x/(ticks * 0.01 + 1), VUp, z/(ticks * 0.01 + 1))
				end
				task.wait()
			until Module.Enabled == false or Uninjected == true
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(5)
		end
		getgenv().Flying = false
	end,
	Dropdowns = {
		FlightMode = {
			"Selection",
			-- Type
			"Flight_Mode",
			-- Name
			1,
			-- current
			{ "Velo", "VClip", "Damage" }
			-- options
		},
		Vertical = {
			"Toggle",
			-- Type
			"Vertical",
			-- Name
			true
			-- CurrentValue
		},
		ClipAmount = {
			"Slider",
			-- Type
			"ClipAmount",
			-- Name
			1,
			-- Min value
			1000,
			-- Max value
			300
			-- Current value
		},
		DamageSpeed = {
			"Slider",
			-- Type
			"DamageSpeed",
			-- Name
			1,
			-- Min value
			4,
			-- Max value
			3
			-- Current value
		},
	},
	Description = "Gain the ability to fly"
}

UILibrary.MakeModule{
	Name = "Speed",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.SpeedMode[3] == 1 then
			local CFSpeed = game:GetService"RunService".Stepped:Connect(function(time, delta)
				if Utilities.GetCharacter() and Utilities.IsAlive(Utilities.GetCharacter()) then
					Utilities.GetCharacter().Humanoid.WalkSpeed = 21
					Utilities.GetCharacter():TranslateBy(Utilities.GetCharacter().Humanoid.MoveDirection * Dropdowns.Speed[5] * delta * 0.25)
					if game.Players.LocalPlayer.Character:GetAttribute("SpeedBoost") then
   	 					Utilities.GetCharacter():TranslateBy(Utilities.GetCharacter().Humanoid.MoveDirection * Dropdowns.Speed[5] * delta * 0.15)
					end
				end
			end)
			repeat task.wait() until Dropdowns.SpeedMode[3] ~= 1 or Module.Enabled == false or Uninjected == true
			Utilities.GetCharacter().Humanoid.WalkSpeed = 16
			CFSpeed:Disconnect()
		elseif Dropdowns.SpeedMode[3] == 2 then
			repeat
				task.wait()
				if Utilities.GetCharacter() then
					Utilities.GetCharacter():SetAttribute("SpeedBoost", Dropdowns.Speed[5] / 6)
					task.wait(0.2)
					Utilities.GetCharacter():SetAttribute("SpeedBoost", nil)
					task.wait(0.55)
				end
			until Module.Enabled == false or Dropdowns.SpeedMode[3] ~= 2 or Uninjected == true
			Utilities.GetCharacter():SetAttribute("SpeedBoost", nil)
		elseif Dropdowns.SpeedMode[3] == 3 then
			repeat
				task.wait()
				if Utilities.GetCharacter() then
					Utilities.GetCharacter():SetAttribute("SpeedBoost", Dropdowns.Speed[5] / 6)
				end
			until Module.Enabled == false or Dropdowns.SpeedMode[3] ~= 3 or Uninjected == true
			Utilities.GetCharacter():SetAttribute("SpeedBoost", nil)
		elseif Dropdowns.SpeedMode[3] == 4 then
			repeat
				task.wait()
				if Utilities.GetCharacter() then
					Utilities.GetCharacter().Humanoid.WalkSpeed = Dropdowns.Speed[5] * 2
				end
			until Module.Enabled == false or Dropdowns.SpeedMode[3] ~= 3 or Uninjected == true
			Utilities.GetCharacter().Humanoid.WalkSpeed = 16
		end
	end,
	Dropdowns = {
		Speed = {
			"Slider",
			-- Type
			"Speed",
			-- Name
			1,
			-- Min value
			100,
			-- Max value
			24
			-- Current value
		},
		PotionBoost = {
			"Toggle",
			"PotionBoost",
			true,
		},
		SpeedMode = {
			"Selection",
			-- Type
			"SpeedMode",
			-- Name
			1,
			-- current
			{
				"CFrame",
				"Inconsistant_Velo",
				"Velocity",
				"Vanilla"
			}
			-- options
		}
	},
	Description = "Speed"
}
UILibrary.MakeModule{
	Name = "HighJump",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.HighJumpMode[3] == 1 then
			for i = 1, math.round(Dropdowns.Acceleration_Amount[5] * 10) do
				task.wait()
				game.Players.LocalPlayer.Character.PrimaryPart.Velocity = game.Players.LocalPlayer.Character.PrimaryPart.Velocity + Vector3.new(0, 2, 0)
			end
		end
	end,
	Dropdowns = {
		Acceleration_Amount = {
			"Slider",
			-- Type
			"Acceleration_Amount",
			-- Name
			1,
			-- Min value
			100,
			-- Max value
			75
			-- Current value
		},
		HighJumpMode = {
			"Selection",
			-- Type
			"HighJump_Mode",
			-- Name
			1,
			-- current
			{ "Acceleration_Velo", "CFrame", "Velo" }
			-- options
		}
	},
	Description = "Various high jump methods to bypass anticheats"
}

UILibrary.MakeModule{
	Name = "Dino Exploit",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local function getremote(tab)
			for i,v in pairs(tab) do
				if v == "Client" then
					return tab[i + 1]
				end
			end
			return ""
		end
		local Client = require(game.ReplicatedStorage.TS.remotes).default.Client
		local dinoremote = getremote(debug.getconstants(debug.getproto(KnitClient.Controllers.DinoTamerController.KnitStart, 3)))
		Client:Get(dinoremote):Connect(function()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 90
		end)

		game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events").useAbility:FireServer("dino_charge")
		Module.Enabled = false
		task.wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	end,
	Dropdowns = {
		Speed = {
			"Slider",-- Type
			"Speed",-- Name
			1,-- Min value
			40,-- Max value
			40-- Current value
		},
	},
	Description = "Dino exploit - gives a speed boost & nerfs anticheat"
}

UILibrary.MakeModule{
	Name = "LongJump",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.Mode[3] == 3 then
			local jumped = false
			
			local hori = Dropdowns.Horizontal[5]
			local vert = Dropdowns.Vertical[5]
			
			local guid = game:GetService("HttpService"):GenerateGUID()
			Bedwars.Projectile:CallServerAsync(
				game.Players.LocalPlayer.Character.InventoryFolder.Value.fireball,
				"fireball",
				"fireball",
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame*CFrame.new(0,-3,4).Position,
				game.Players.LocalPlayer.Character.PrimaryPart.Position,
				Vector3.new(0,-20,0),
				guid,
				{
					["drawDurationSeconds"] = 1
				},
				workspace:GetServerTimeNow()
			)
			repeat
				task.wait()
				if game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Y > 4 then
					jumped = true
					local X = game.Players.LocalPlayer.Character.PrimaryPart.Velocity.X * hori
					local Y = game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Y * vert
					local Z = game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Z * hori
					game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(X,Y,Z)
				end
			until jumped == true
		elseif Dropdowns.Mode[3] == 1 then
			local VeloMulti = Dropdowns.Horizontal[5] * 4
			local Character = game.Players.LocalPlayer.Character

			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
			game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X * VeloMulti / 1.5, Character.HumanoidRootPart.Velocity.Y + .1, Character.HumanoidRootPart.Velocity.Z * VeloMulti / 1.5)
			for i=1,20 do
				task.wait()
				workspace.Gravity = i
				Character.HumanoidRootPart.Velocity = Vector3.new(Character.HumanoidRootPart.Velocity.X, Character.HumanoidRootPart.Velocity.Y + Dropdowns.Vertical[5] / 90, Character.HumanoidRootPart.Velocity.Z)
			end
			workspace.Gravity = 192.6
			if Dropdowns.KillVelocity[3] == true then
				Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
			end
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
			elseif Dropdowns.Mode[3] == 2 then
			for i = 1,15 do
				task.wait(.05)
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame * CFrame.new(0,Vertical * 3.5/i,-Dropdowns.Horizontal[5] * 1.5)
			end
		end
        Module.Enabled = false
	end,
	Dropdowns = {
	    Horizontal = {
			"Slider",
			-- Type
			"Horizontal",
			-- Name
			1,
			-- Min value
			4,
			-- Max value
			2.5
			-- Current value
		},
	    Vertical = {
			"Slider",
			-- Type
			"Vertical",
			-- Name
			1,
			-- Min value
			3,
			-- Max value
			1.75
			-- Current value
		},
		KillVelocity = {
			"Toggle",
			"Kill_Velocity",
			true,
		},
		Mode = {
			"Selection",
			"Mode",
			1,
			{"Velocity","CFrame","Damage"}
		}
	},
	Description = "long jump"
}

UILibrary.MakeModule{
	Name = "Sprint",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		repeat
			task.wait()
			if not sprinttable.sprinting then
				sprinttable:startSprinting()
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {},
	Description = "Sprint"
}

UILibrary.MakeModule{
	Name = "LagbackSelf",
	Tab = Movement,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		for i = 1, 10 do
			task.wait(0.1)
			game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(0, 900, 0)
		end
	end,
	Dropdowns = {},
	Description = "Useful for abusing lackbacks to instantly teleport at start of game"
}

UILibrary.MakeModule{
	Name = "Velocity",
	Tab = Combat,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local x = require(game:GetService"ReplicatedStorage".TS.damage["knockback-util"]).KnockbackUtil
		local oldfunctions = {}
		local counter = 0
		for i, v in pairs(x) do
			counter = counter + 1
			table.insert(oldfunctions, counter, v)
		end
		for i, v in pairs(x) do if type(v) == "function" then x[i] = function() end end end
	end,
	Dropdowns = {},
	Description = "Reduce knockback"
}

UILibrary.MakeModule{
	Name = "ChestStealer",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		repeat
			task.wait(0.15)
			for i, v in pairs(Chests) do
				local Magnitude = (v.Position - Utilities.GetCharacter().PrimaryPart.Position).Magnitude
				if Magnitude <= Dropdowns.StealDistance[5] then
					for _, item in pairs(v.ChestFolderValue.Value:GetChildren()) do
						if item:IsA"Accessory" then
							task.wait()
							Bedwars.ChestGet:InvokeServer(v.ChestFolderValue.Value, item)
						end
					end
				end
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {
		StealDistance = {
			"Slider",
			-- Type
			"Steal_Distance",
			-- Name
			5,
			-- Min value
			23,
			-- Max value
			23
			-- Current value
		}
	},
	Description = "Quickly steals items from nearby chests"
}

local lplr = game.Players.LocalPlayer
local BlockEngine = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine
local BlockEngineClientEvents = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents
local BlockController = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine
local BlockControllertw = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer
local cam = game.Workspace.Camera
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0

local scaffoldanim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new((0.2)), {
	C0 = origC0 * CFrame.new(0.2, -.1, 0.2) * CFrame.Angles(-math.rad(130), math.rad(0), -math.rad(0))
})

local stop = game:GetService"TweenService":Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.1), { C0 = origC0 })

UILibrary.MakeModule{
	Name = "Scaffold",
	Tab = World,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local oldpos = Vector3.zero
		local oldpos2 = Vector3.zero

		local function getScaffold(vec, diagonaltoggle)
			local realvec = vec3(math.floor((vec.X / 3) + 0.5) * 3, math.floor((vec.Y / 3) + 0.5) * 3, math.floor((vec.Z / 3) + 0.5) * 3) 
			local newpos = (oldpos - realvec)
			local returedpos = realvec
			if entity.isAlive then
				local angle = math.deg(math.atan2(-entity.character.Humanoid.MoveDirection.X, -entity.character.Humanoid.MoveDirection.Z))
				local goingdiagonal = (angle >= 130 and angle <= 150) or (angle <= -35 and angle >= -50) or (angle >= 35 and angle <= 50) or (angle <= -130 and angle >= -150)
				if goingdiagonal and ((newpos.X == 0 and newpos.Z ~= 0) or (newpos.X ~= 0 and newpos.Z == 0)) and diagonaltoggle then
					return oldpos
				end
			end
			return realvec
		end

		local function getwool()
			local block = nil
			local blocks = {}
			local prefer = math.random(1,2)
			local choosen = "wool_green"
			if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("InventoryFolder") then
				for i,v in pairs(game.Players.LocalPlayer.Character.InventoryFolder.Value:GetChildren()) do
					if string.find(v.Name,"wool") then
						block = v
					end
				end
				if block then
					return block.Name,block:GetAttribute("Amount")
				end
			end
		end

		local blocktable = BlockControllertw.new(BlockEngine, getwool())
		local animplaying = false


		function placeblocks(newpos)
			local placeblocktype = getwool()
			blocktable.blockType = placeblocktype
			task.spawn(function()
				scaffoldanim:Play()
				task.wait(.2)
				stop:Play()
				task.wait(.2)
			end)
			if BlockController:isAllowedPlacement(lplr, placeblocktype, Vector3.new(math.round(newpos.X / 3 + .5), math.round(newpos.Y / 3), math.round(newpos.Z / 3))) then
				blocktable:placeBlock(Vector3.new(math.round(newpos.X / 3), math.round(newpos.Y / 3), math.round(newpos.Z / 3)))
			end
		end

		local UserInputService = game:GetService("UserInputService")
		function Scaffold_Main()
			local spaceHeld = UserInputService:IsKeyDown(Enum.KeyCode.Space)
			local Player = game.Players.LocalPlayer
			local HRP = Player.Character.HumanoidRootPart
			local raydown = true
			if spaceHeld and raydown and Dropdowns.Tower[3] == true then
				game.Players.LocalPlayer.Character.PrimaryPart.Velocity = Vector3.new(game.Players.LocalPlayer.Character.PrimaryPart.Velocity.X,35,game.Players.LocalPlayer.Character.PrimaryPart.Velocity.Z)
			end
			placeblocks(game.Players.LocalPlayer.Character.PrimaryPart.CFrame * CFrame.new(0,0,-1) - Vector3.new(0,5,0))
		end
		repeat
			task.wait()
			task.spawn(function()
				Scaffold_Main()
			end)
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {
		ScaffoldAnimation = {
			"Toggle",
			"Scaffold_Animation",
			true,
		},
		Tower = {
			"Toggle",
			"Tower",
			true,
		},
	},
	Description = "Places blocks below you automatically"
}

local armor = 0
local sword = 0

UILibrary.MakeModule{
	Name = "Autobuy",
	Tab = Player,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		local remote = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BedwarsPurchaseItem
		local remote2 = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BedwarsPurchaseTeamUpgrade
		local BlockAmount = 2

		BuyBlocks = function()
			remote:InvokeServer({
				["shopItem"] = {
					["currency"] = "iron",
					["itemType"] = "wool_white",
					["amount"] = 16,
					["price"] = 8,
					["category"] = "Blocks"
				}
			})
		end

		BuySword = function(sword)
			remote:InvokeServer({
				["shopItem"] = {
					["currency"] = "iron",
					["itemType"] = sword.."_sword",
					["amount"] = 1,
					["price"] = 20,
					["category"] = "Combat",
					["ignoredByKit"] = {
						"barbarian",
						"dasher"
					},
				["lockAfterPurchase"] = true}
			})
		end

		BuyArmor = function(armor)
			remote:InvokeServer({
				["shopItem"] = {
					["lockAfterPurchase"] = true,
					["itemType"] = armor.."_chestplate",
					["price"] = 50,
					["customDisplayName"] = "Leather Armor",
					["currency"] = "iron",["amount"] = 1,
					["category"] = "Combat",
					["ignoredByKit"] = {
						"bigman"
					},
				["spawnWithItems"] = {
					"leather_helmet",
					"leather_chestplate",
					"leather_boots"
				},
				["nextTier"] = "iron_chestplate"
				}
			}) 
		end

		Armory = function()
			remote2:InvokeServer({
				["upgradeId"] = "armory",
				["tier"] = 0
			}) 
		end

		armorlist = {
			"leather",
			"iron",
			"diamond",
			"emerald",
			"max",
		}

		swordlist = {
			"stone",
			"iron",
			"diamond",
			"emerald",
			"max",
		}

		DeathHandler = function()

		end

		repeat
			task.wait()
			if game.Players.LocalPlayer.Character then
				local Inventory = game.Players.LocalPlayer.Character:WaitForChild("InventoryFolder").Value
				if sword > 2 then
					Armory()
				end
				if armor <= sword then
					BuyArmor(armorlist[armor + 1])
					task.wait(.5)
					if Inventory:FindFirstChild(armorlist[armor + 1].."_boots") then
						armor = armor + 1
					end
				else
					BuySword(swordlist[sword + 1])
					task.wait(.5)
					if Inventory:FindFirstChild(swordlist[sword + 1].."_sword") then
						sword = sword + 1
					end
				end
			end
		until Module.Enabled == false or Uninjected == true
	end,
	Dropdowns = {},
	Description = "Automatically buys items from the shop"
}

UILibrary.MakeModule{
	Name = "ESP",
	Tab = Visual,
	Bind = nil,
	Enabled = false,
	Function = function(Module, Dropdowns)
		if Dropdowns.Mode[3] == 2 then
			if getgenv().Destroy then return error("esp already loaded") end
				local defaultBoxProperties = {
					Thickness = 1;
					Color = Color3.new(0.878431, 0.349019, 0.349019); 
					Outlined = true;
					Rounding = 4;
				}

				local defaultTextProperties = {
					Size = 18;
					Color = Color3.new(0.874509, 0.874509, 0.874509);
					Outlined = true;
				}

				local playerList, connects, colors, games = {}, {}, {
					HealthMax = Color3.new(0, 1, 0);
					HealthMin = Color3.new(1, 0, 0);
				}, {
					Rogue = game.GameId == 1087859240;
					FightingGame = game.GameId == 1277659167;
					Deepwoken = game.GameId == 1359573625;
				}

				local Enabled = true

				local Players = game:GetService("Players")
				local RunService = game:GetService("RunService")
				local LocalPlayer = Players.LocalPlayer

				local Camera = game:GetService("Workspace").CurrentCamera

				local StreamingEnabled = workspace.StreamingEnabled

				local lower, FindFirstChildOfClass, floor, clamp = string.lower, game.FindFirstChildOfClass, math.floor, math.clamp

				local function Destroy()
					Enabled = false; task.wait(0.05)

					for _,v in pairs(connects) do v:Disconnect() end
					for _,v in pairs(playerList) do v:Destroy() end

					table.clear(playerList)
					table.clear(connects)

					RunService:UnbindFromRenderStep("ESP")

					getgenv().Destroy = nil
				end; getgenv().Destroy = Destroy

				local function GetHeldTool(Character) if Utilities.IsAlive(Character) and Character:FindFirstChild("HandInvItem") and Character:FindFirstChild("HandInvItem").Value then local t = Character.HandInvItem.Value return t and t.Name or "none" else return "none" end end

				local Player = {}; do
					Player.__index = Player

					function Player.new(player)
						if player == LocalPlayer then return end
						
						local self = {}; setmetatable(self, Player)

						self.Player = player
						self.Character = player.Character
						self.Humanoid = nil
						self.RootPart = nil
						self.HPP = nil
						self.Health = nil
						self.MaxHealth = nil
						self.Distance = 0
						self.Name = player.Name
						self.Team = player.Team ~= nil and player.Team.Name or nil
						self.Drawings = {}
						self.Connects = {}
						self.Points = {}

						self.Connects["CharacterAdded"] = player.CharacterAdded:Connect(function(char) self:SetupCharacter(char) end)
						self.Connects["CharacterRemoving"] = player.CharacterRemoving:Connect(function() 
							for i,v in pairs({"Character", "RootPart", "Humanoid"}) do
								self[v] = nil
							end
						end)
						self.Connects["TeamChanged"] = player:GetPropertyChangedSignal("Team"):Connect(function()
							self.Team = player.Team ~= nil and player.Team.Name or nil
						end)

						self:SetupCharacter(player.Character)

						table.insert(playerList, self)

						return self
					end

					function Player:SetupCharacter(Character)
						if Character then --// todo: make function to support other games (i.e. phantom forces, strucid, etc,.)
							self.Character = Character
							self.RootPart = Character:WaitForChild("HumanoidRootPart", 3)
							self.Humanoid = Character:WaitForChild("Humanoid", 3)
							self.Health = self.Humanoid.Health
							self.MaxHealth = self.Humanoid.MaxHealth
							self.HPP = self.Health / self.MaxHealth
							
							if StreamingEnabled and self.Character and not self.RootPart then
								self.Connects["ChildAdded"] = self.Character.ChildAdded:Connect(function(part)
									if part.Name == "HumanoidRootPart" and part:WaitForChild("RootRigAttachment", 3) then
										self.RootPart = part
										self:SetupESP()
									end
								end)
							end

							if self.RootPart then
								self:SetupESP()
							end
						end
					end

					function Player:SetupESP()
						--// create points
						local topLeftBoxPoint = PointInstance.new(self.RootPart, CFrame.new(-2, 2.5, 0))
						local bottomLeftBoxPoint = PointInstance.new(self.RootPart, CFrame.new(-2, -3, 0))
						local bottomRightBoxPoint = PointInstance.new(self.RootPart, CFrame.new(2, -3, 0))
						
						local middleHealthPoint = PointInstance.new(self.RootPart, CFrame.new(-2, 2.5, 0))
						local topLeftHealthPoint = PointOffset.new(topLeftBoxPoint, -4, 0)
						local bottomRightHealthPoint = PointOffset.new(bottomLeftBoxPoint, -3, 0)

						local textPoint = PointInstance.new(self.RootPart, CFrame.new(0, -3, 0))

						for i,v in pairs({topLeftBoxPoint, bottomRightBoxPoint, textPoint, bottomLeftBoxPoint}) do v.RotationType = CFrameRotationType.CameraRelative end
						--// create drawings
						local PrimaryBox = RectDynamic.new(topLeftBoxPoint, bottomRightBoxPoint); for i,v in pairs(defaultBoxProperties) do PrimaryBox[i] = v end
						PrimaryBox.Visible = false

						local PrimaryText = TextDynamic.new(textPoint); for i,v in pairs(defaultTextProperties) do PrimaryText[i] = v end
						PrimaryText.Text = self.Name
						PrimaryText.YAlignment = YAlignment.Bottom
						PrimaryText.Visible = false
						
						local HealthBox = RectDynamic.new(topLeftHealthPoint, bottomRightHealthPoint); for i,v in pairs(defaultBoxProperties) do HealthBox[i] = v end
						HealthBox.Filled = true
						HealthBox.Color = colors.HealthMax
						HealthBox.Rounding = 0
						HealthBox.Visible = false
				--[[   
						local HealthBoxBorder = RectDynamic.new(PointOffset.new(topLeftBoxPoint, -6, -1), PointOffset.new(topLeftBoxPoint, -2, 1))
						HealthBoxBorder
				]]	  
						--// add to table for updates
						self.Drawings.Box = PrimaryBox
						self.Drawings.Text = PrimaryText
						self.Drawings.HealthBar = HealthBox

						self.Points.TopLeftBox = topLeftBoxPoint
						self.Points.BottomLeftBox = bottomLeftBoxPoint
						self.Points.BottomRightBox = bottomRightBoxPoint

						self.Points.MiddleHealth = middleHealthPoint 
						self.Points.TopLeftHealth = topLeftHealthPoint
						self.Points.BottomRightHealth = bottomRightHealthPoint

						self:UpdateHealth()
						self.Connects["HealthChanged"] = self.Humanoid.HealthChanged:Connect(function()
							self:UpdateHealth()
						end)
					end

					function Player:UpdateHealth()
						self.HPP = self.Humanoid.Health / self.Humanoid.MaxHealth
					
						local topLeftHealthPoint = PointInstance.new(self.RootPart, CFrame.new(-2, (self.HPP * 5.5) - 3, 0))
						self.Points.TopLeftHealth = PointOffset.new(topLeftHealthPoint, -4, 0)
						self.Drawings.HealthBar.Position = self.Points.TopLeftHealth

						self.Drawings.HealthBar.Color = colors.HealthMax:Lerp(colors.HealthMin, clamp(1 - self.HPP, 0, 1)) --// thx ic3 
					end

					function Player:Update()
						if not self.Player then self:Destroy() return end --// if the player is gone then dont update

						local Box = self.Drawings.Box
						local Text = self.Drawings.Text
						local HealthBar = self.Drawings.HealthBar
						
						if not Box or not Text or not self.Character or not self.RootPart or not self.Humanoid then return end --// if no box or text or character then dont update
						
						for i,v in pairs({Box, Text, HealthBar}) do v.Visible = Enabled end 

						--// set vars
						local Humanoid = self.Humanoid
						local Health, MaxHealth = Humanoid.Health, Humanoid.MaxHealth
						local HPP = clamp(Health / MaxHealth, 0, 1)

						--// var updates
						self.Health = Health
						self.MaxHealth = MaxHealth
						self.Distance = (self.RootPart.Position - Camera.CFrame.Position).Magnitude


						--// get display name | todo: function for getting display name to support other games easier?
						local InGameName;
						if games.Deepwoken and self.Humanoid and self.Humanoid.DisplayName then 
							local displayName = self.Humanoid.DisplayName:split("\n")[1]
							InGameName = displayName
						end

						--// update text
						Text.Text = self.Name..((games.Deepwoken and InGameName) and " ["..InGameName.."]" or "").."\n["..floor((Camera.CFrame.p - self.RootPart.Position).Magnitude).."] ["..floor(self.Humanoid.Health).."/"..floor(self.Humanoid.MaxHealth).."]\n["..GetHeldTool(self.Character).."]"

						--// update box transparency
						local newOpacity = clamp(1 - self.Distance / 3500, 0.2, 1)
						for i,v in pairs({HealthBar, Text, Box}) do v.Opacity = newOpacity v.OutlineOpacity = newOpacity end

						if newOpacity > 0.85 and not self.OnTop then
							for i,v in pairs({Text, HealthBar, Box}) do v:MoveToFront() end
							self.OnTop = true
						elseif newOpacity <= 0.85 and self.OnTop then
							for i,v in pairs({Text, HealthBar, Box}) do v:MoveToBack() end
							self.OnTop = false
						end
					end

					function Player:Destroy()
						for i,v in pairs(self.Connects) do v:Disconnect() end

						for i,v in pairs(self.Drawings) do v.Visible = false end

						self:Update()

						table.clear(self.Drawings)
						table.clear(self.Connects)

						for i,v in pairs(self) do
							if typeof(v) == "table" then
								table.clear(v)
							elseif typeof(v) == "RBXScriptSignal" then
								v:Disconnect()
							end
							self[i] = nil
						end

						table.remove(playerList, table.find(playerList, self))

						self = nil
					end
				end

				for _,v in pairs(Players:GetPlayers()) do task.spawn(Player.new, v) end

				table.insert(connects, Players.PlayerAdded:Connect(Player.new))
				table.insert(connects, game:GetService("UserInputService").InputBegan:Connect(function(inputObject, gp)
					if gp then return end
					if inputObject.KeyCode == Enum.KeyCode.F3 then
						Enabled = not Enabled
					end
				end))

				RunService:BindToRenderStep("ESP", 200, function()
					for i,v in pairs(playerList) do
						v:Update()
					end
				end)
			else
				local Box_Color = Color3.fromHSV(0.878431, 0.349019, 0.349019)
				local Tracer_Color = Color3.fromRGB(255, 0, 0)
				local HealthBar_Color = Color3.fromRGB(0, 255, 0)

				local Tracer_Thickness = 1
				local Box_Thickness = 1.35
				local ESPBoxes = {}

				local teamcheck = {
					teamcheck = true,
					green = Color3.fromHSV(0.878431, 0.349019, 0.349019),
					red = Color3.fromRGB(245, 69, 5)
				}

				local plr = game.Players.LocalPlayer
				local camera = game.Workspace.CurrentCamera

				local function NewQuad(thickness, color)
					local quad = Drawing.new("Quad")
					quad.Visible = false
					quad.PointA = Vector2.new(0,0)
					quad.PointB = Vector2.new(0,0)
					quad.PointC = Vector2.new(0,0)
					quad.PointD = Vector2.new(0,0)
					quad.Color = color
					quad.Filled = false
					quad.Thickness = thickness
					quad.Transparency = 1
					return quad
				end

				local function NewLine(thickness, color)
					local line = Drawing.new("Line")
					line.Visible = false
					line.From = Vector2.new(0, 0)
					line.To = Vector2.new(0, 0)
					line.Color = color
					line.Thickness = thickness
					line.Transparency = 1
					return line
				end

				local black = Color3.fromRGB(0, 0, 0)

				for i, v in pairs(game.Players:GetChildren()) do
					local library = {
						black = NewQuad(Box_Thickness*2, black),
						box = NewQuad(Box_Thickness, Box_Color),
						healthbar = NewLine(5, black),
						greenhealth = NewLine(4, HealthBar_Color)
					}

					local function Visibility(state)
						for u, x in pairs(library) do
							x.Visible = state
						end
					end

					local function ESP()
						local connection
						connection = game:GetService("RunService").RenderStepped:Connect(function()
							if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Name ~= plr.Name and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("Head") ~= nil then
								local ScreenPos, OnScreen = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
								if OnScreen then
									local head = camera:WorldToViewportPoint(v.Character.Head.Position)
									local rootpos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)

									local ratio = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(rootpos.X, rootpos.Y)).magnitude, 2, math.huge)

									local head2 = camera:WorldToViewportPoint(Vector3.new(v.Character.Head.Position.X, v.Character.Head.Position.Y + 2, v.Character.Head.Position.Z))

									local root2 = camera:WorldToViewportPoint(Vector3.new(v.Character.Head.Position.X, v.Character.HumanoidRootPart.Position.Y - 3, v.Character.Head.Position.Z))

									library.black.PointA = Vector2.new(head2.X + ratio*1.6, head2.Y - ratio*0.05)
									library.black.PointB = Vector2.new(head2.X - ratio*1.6, head2.Y - ratio*0.05)
									library.black.PointC = Vector2.new(head2.X - ratio*1.6, root2.Y + ratio*0.5)
									library.black.PointD = Vector2.new(head2.X + ratio*1.6, root2.Y + ratio*0.5)

									library.box.PointA = Vector2.new(head2.X + ratio*1.6, head2.Y - ratio*0.05)
									library.box.PointB = Vector2.new(head2.X - ratio*1.6, head2.Y - ratio*0.05)
									library.box.PointC = Vector2.new(head2.X - ratio*1.6, root2.Y + ratio*0.5)
									library.box.PointD = Vector2.new(head2.X + ratio*1.6, root2.Y + ratio*0.5)
									
									local d = (Vector2.new(head2.X - ratio*1.8, head2.Y - ratio*0.05) - Vector2.new(root2.X - ratio*1.8, root2.Y + ratio*0.5)).magnitude
									local green = (100-v.Character.Humanoid.Health) *d /100

									library.greenhealth.Thickness = math.clamp(ratio/4, 1, 4)
									library.healthbar.Thickness = math.clamp(ratio * 1.2 / 4, 1.5, 6)

									library.healthbar.To = Vector2.new(head2.X - ratio*1.8, head2.Y - ratio*0.05)
									library.healthbar.From = Vector2.new(head2.X - ratio*1.8, root2.Y + ratio*0.5)

									library.greenhealth.To = Vector2.new(head2.X - ratio*1.8, head2.Y + green - ratio*0.05)
									library.greenhealth.From = Vector2.new(head2.X - ratio*1.8, root2.Y + ratio*0.5)

									if teamcheck.teamcheck == true then
										if v.TeamColor == plr.TeamColor then
											library.box.Color = teamcheck.green
										else 
											library.box.Color = teamcheck.red
										end
									end

									Visibility(true)
								else 
									Visibility(false)
								end
							else 
								Visibility(false)
								if game.Players:FindFirstChild(v.Name) == nil then
									connection:Disconnect()
								end
							end
						end)
					end
					coroutine.wrap(ESP)()
				end

				game.Players.PlayerAdded:Connect(function(newplr)
					local library = {
						black = NewQuad(Box_Thickness*2, black),
						box = NewQuad(Box_Thickness, Box_Color),
						healthbar = NewLine(8, black),
						greenhealth = NewLine(4, HealthBar_Color)
					}

					local function Visibility(state)
						for u, x in pairs(library) do
							x.Visible = state
						end
					end

					getgenv().Destroy = Visibility(false)

					local function ESP()
						local connection
						connection = game:GetService("RunService").RenderStepped:Connect(function()
							if newplr.Character ~= nil and newplr.Character:FindFirstChild("Humanoid") ~= nil and newplr.Character:FindFirstChild("HumanoidRootPart") ~= nil and newplr.Name ~= plr.Name and newplr.Character.Humanoid.Health > 0 and newplr.Character:FindFirstChild("Head") ~= nil then
								local ScreenPos, OnScreen = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)
								if OnScreen then
									local head = camera:WorldToViewportPoint(newplr.Character.Head.Position)
									local rootpos = camera:WorldToViewportPoint(newplr.Character.HumanoidRootPart.Position)

									local ratio = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(rootpos.X, rootpos.Y)).magnitude, 2, math.huge)

									local head2 = camera:WorldToViewportPoint(Vector3.new(newplr.Character.Head.Position.X, newplr.Character.Head.Position.Y + 2, newplr.Character.Head.Position.Z))

									local root2 = camera:WorldToViewportPoint(Vector3.new(newplr.Character.Head.Position.X, newplr.Character.HumanoidRootPart.Position.Y - 3, newplr.Character.Head.Position.Z))

									library.black.PointA = Vector2.new(head2.X + ratio*1.6, head2.Y - ratio*0.05)
									library.black.PointB = Vector2.new(head2.X - ratio*1.6, head2.Y - ratio*0.05)
									library.black.PointC = Vector2.new(head2.X - ratio*1.6, root2.Y + ratio*0.5)
									library.black.PointD = Vector2.new(head2.X + ratio*1.6, root2.Y + ratio*0.5)

									library.box.PointA = Vector2.new(head2.X + ratio*1.6, head2.Y - ratio*0.05)
									library.box.PointB = Vector2.new(head2.X - ratio*1.6, head2.Y - ratio*0.05)
									library.box.PointC = Vector2.new(head2.X - ratio*1.6, root2.Y + ratio*0.5)
									library.box.PointD = Vector2.new(head2.X + ratio*1.6, root2.Y + ratio*0.5)

									local d = (Vector2.new(head2.X - ratio*1.8, head2.Y - ratio*0.05) - Vector2.new(root2.X - ratio*1.8, root2.Y + ratio*0.5)).magnitude
									local green = (100-newplr.Character.Humanoid.Health) *d /100

									library.greenhealth.Thickness = math.clamp(ratio/4, 1, 4)
									library.healthbar.Thickness = math.clamp(ratio * 1.2 / 4, 1.5, 6)

									library.healthbar.To = Vector2.new(head2.X - ratio*1.8, head2.Y - ratio*0.05)
									library.healthbar.From = Vector2.new(head2.X - ratio*1.8, root2.Y + ratio*0.5)

									library.greenhealth.To = Vector2.new(head2.X - ratio*1.8, head2.Y + green - ratio*0.05)
									library.greenhealth.From = Vector2.new(head2.X - ratio*1.8, root2.Y + ratio*0.5)

									if teamcheck.teamcheck == true then
										if newplr.TeamColor == plr.TeamColor then
											library.box.Color = teamcheck.green
										else 
											library.box.Color = teamcheck.red
										end
									end

									Visibility(true)
								else 
									Visibility(false)
								end
							else 
								Visibility(false)
								if game.Players:FindFirstChild(newplr.Name) == nil then
									connection:Disconnect()
								end
							end
						end)
					end
					coroutine.wrap(ESP)()
				end)
			end
		repeat task.wait() until Module.Enabled == false or Uninjected == true
		Destroy()
	end,
	Dropdowns = {
		Mode = {
			"Selection",
			"Mode",
			1,
			{"Normal","synapse v3"}
		}
	},
	Description = "ESP"
}

Notifications.Notify("Prism", "loaded in " .. tick() - executiontime .. " seconds.", 5, getgenv().HUDColor)
