game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Shu X Private",
Text = "Made by Ferhad/Shu", 
Duration = 30 
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Unknownuser11736/suntaiteam/main/kavouilibrary/fixedsliders"))()
local Window = Library.CreateLib("Shu X Private", "BloodTheme")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()

local Credits = Window:NewTab("Credits")
local Combat = Window:NewTab("Combat")
local Blatant = Window:NewTab("Blatant")
local Render = Window:NewTab("Render")
local Utility = Window:NewTab("Utility")
local World = Window:NewTab("World")

--Sections--

local Credits = Credits:NewSection("Credits")

local Toxic = Render:NewSection("AutoToxic")

local Esp = Blatant:NewSection("Esp")

local Animation = Utility:NewSection("Animations")

--SCRIPTS--

Credits:NewLabel("----Official Credits----")
Credits:NewLabel("Made by shu#6969")
Credits:NewLabel("Co owner Vortex#6969")
Credits:NewLabel("Credits to everyone that helped this script.")
Credits:NewLabel("I cant credit alot of ppl thats why.")

local players = game:GetService("Players")

local lplr = players.LocalPlayer

local oldchar = lplr.Character

local cam = workspace.CurrentCamera

local uis = game:GetService("UserInputService")

local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)

local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client

local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil

local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)

local RenderStepTable = {}

local StepTable = {}

local connectioninfjump

local killauraswing = {["Enabled"] = true}

local killaurasound = {["Enabled"] = true}

local killaurahitdelay = {["Value"] = 2}

local killaurasoundval = {["Value"] = 1}

local speedval = {["Value"] = 1}

local testtogttt = {["Value"] = 20}

local ACC1

local ACC2

local antivoidtransparent = {["Value"] = 50}

local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}

local reachval = {["Value"] = 18}

local autoclick = {["Enabled"] = true}

local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0

local killaurafirstpersonanim = {["Value"] = true}

local killauraanimval = {["Value"] = "Cool"}

local SprintCont = KnitClient.Controllers.SprintController

local SwordCont = KnitClient.Controllers.SwordController

local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)

local ClientHandler = Client

local colors = {
	SchemeColor = Color3.fromRGB(0,255,255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()

do
	local oldcharacteradded = entity.characterAdded
	entity.characterAdded = function(plr, char, localcheck)
		return oldcharacteradded(plr, char, localcheck, function() end)
	end
	entity.fullEntityRefresh()
end

local colorbox
local function makeRainbowText(text)
	spawn(function()
		colorbox = Color3.fromRGB(170,0,170)
		local x = 0
		while wait() do
			colorbox = Color3.fromHSV(x,1,1)
			x = x + 4.5/255
			if x >= 1 then
				x = 0
			end
		end
	end)
	spawn(function()
		repeat
			wait()
			text.TextColor3 = colorbox
		until true == false
	end)
end


repeat task.wait() until (entity.isAlive)

local players = game:GetService("Players")
local lplr = players.LocalPlayer
local oldchar = lplr.Character
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local RenderStepTable = {}
local StepTable = {}
local connectioninfjump
local killauraswing = {["Enabled"] = true}
local killaurasound = {["Enabled"] = true}
local killaurahitdelay = {["Value"] = 2}
local killaurasoundval = {["Value"] = 1}
local speedval = {["Value"] = 1}
local testtogttt = {["Value"] = 20}
local ACC1
local ACC2
local antivoidtransparent = {["Value"] = 50}
local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}
local reachval = {["Value"] = 18}
local autoclick = {["Enabled"] = true}
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}

local SprintCont = KnitClient.Controllers.SprintController
local SwordCont = KnitClient.Controllers.SwordController
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local ClientHandler = Client

local function GetURL(scripturl)
	return game:HttpGet("https://raw.githubusercontent.com/7GrandLittleBrother/SytroNight4ROBLOX/main/"..scripturl, true)
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
local equipped = getEquipped()
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local sword = (equipped.Object and (equipped.Object.Name == "frying_pan" or equipped.Object.Name == "baguette") and {tool = equipped.Object} or getsword())
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					local attacksuccess = attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = sword["tool"],
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if attacksuccess and itemtab[sword["tool"].Name].sword.respectAttackSpeedOnServer then 
						killaurahitdelay = tick() + itemtab[sword["tool"].Name].sword.attackSpeed
					end
					if killaurahitdelay > tick() then 
						return nil
					end
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant

local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
local hrp = char.HumanoidRootPart
local hmd = char.Humanoid
local cam = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client

local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
local sprintthingy = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.sprint["sprint-controller"]).SprintController
local kbtable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemtablefunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
local itemtable = debug.getupvalue(itemtablefunc, 1)
local matchend = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.game.match["match-end-controller"]).MatchEndController
local matchstate = require(game:GetService("ReplicatedStorage").TS.match["match-state"]).MatchState
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local ballooncontroller = KnitClient.Controllers.BalloonController
local queuemeta = require(game:GetService("ReplicatedStorage").TS.game["queue-meta"]).QueueMeta
local clntstorehandlr = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
local matchState = clntstorehandlr:getState().Game.matchState
local itemmeta = require(game:GetService("ReplicatedStorage").TS.item["item-meta"])
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local uis = game:GetService("UserInputService")

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

local clonetwo
local function secondclonemake()
    clonetwo = realchar:Clone()
    clonetwo.Parent = workspace
end

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))  

function getinv(plr)
    local plr = plr or lplr
    local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
    return (thingy and thingytwo or {
        items = {},
        armor = {},
        hand = nil
    })
end

function getsword()
    local sd
    local higherdamage
    local swordslots
    local swords = getinv().items
    for i, v in pairs(swords) do
        if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
            if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
                sd = v
                higherdamage = itemstuff[v.itemType].sword.damage
                swordslots = i
            end
        end
    end
    return sd, swordslots
end

local function hvFunc(cock)
    return {hashedval = cock}
end

local killauraissoundenabled = {["Value"] = false}
local killaurasoundvalue = {["Value"] = 1}
local killauraisswingenabled = {["Value"] = false}
local DistVal = {["Value"] = 18}
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}

local function playsound(id, volume) 
    local sound = Instance.new("Sound")
    sound.Parent = workspace
    sound.SoundId = id
    sound.PlayOnRemove = true 
    if volume then 
        sound.Volume = volume
    end
    sound:Destroy()
end

local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function playanimation(id) 
    if isAlive() then 
        local animation = Instance.new("Animation")
        animation.AnimationId = id
        local animatior = lplr.Character.Humanoid.Animator
        animatior:LoadAnimation(animation):Play()
    end
end

local funnyanim = {
    {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.10},
    {CFrame = CFrame.new(0.5, -0.51, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08},
    {CFrame = CFrame.new(0.5, -0.01, -1.91) * CFrame.Angles(math.rad(-51), math.rad(9), math.rad(56)), Time = 0.08}
}

local autoblockanim = {
    {CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(-90), math.rad(90), math.rad(0)), Time = 0.08},
    {CFrame = CFrame.new(-0.01, -0.01, -1.01) * CFrame.Angles(math.rad(10), math.rad(70), math.rad(-90)), Time = 0.08},
}

local theotherfunnyanim = {
    {CFrame = CFrame.new(-1.8, 0.5, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), Time = 0.05},
    {CFrame = CFrame.new(-1.8, -0.21, -1.01) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), Time = 0.05}
}

local kmsanim = {
    {CFrame = CFrame.new(-2.5, -4.5, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.1},
    {CFrame = CFrame.new(-2.5, -1, -0.02) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-0)), Time = 0.05}
}

local rgfejd = false
function KillauraRemote()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
            local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
                if v.Character.Humanoid.Health > 0 then
                    for k, b in pairs(whiteliststhing) do
                        if v.UserId ~= tonumber(b) then
                            rgfejd = true
                            local GBW = getsword()
                            local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
                            local Entity = v.Character
                            local target = v.Character:GetPrimaryPartCFrame().Position
                            attackentitycont:CallServer({
                                ["chargedAttack"] = {["chargeRatio"] = 1},
                                ["weapon"] = GBW ~= nil and GBW.tool,
                                ["entityInstance"] = Entity,
                                ["validate"] = {["targetPosition"] = {["value"] = target,
                                    ["hash"] = hvFunc(target)},
                                    ["raycast"] = {
                                        ["cameraPosition"] = hvFunc(cam.CFrame.Position), 
                                        ["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
                                    },
                                    ["selfPosition"] = {["value"] = selfPosition,
                                        ["hash"] = hvFunc(selfPosition)
                                    }
                                }
                            })
                            if killauraissoundenabled["Value"] then
                                playsound("rbxassetid://6760544639", killaurasoundvalue["Value"])
                            end
                            if killauraisswingenabled["Value"] then         
                                playanimation("rbxassetid://4947108314")
                            end
                        end
                    end
                end
            else
                rgfejd = false
            end
        end
    end 
end

-- targetcheck, isplayertargetable, getallnearesthumanoidtoposition are from vape, i used those for the kill aura anims

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
    return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
    local returnedplayer = {}
    local currentamount = 0
    if entity.isAlive then -- alive check
        for i, v in pairs(game.Players:GetChildren()) do -- loop through players
            if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
                if mag <= distance then -- mag check
                    table.insert(returnedplayer, v)
                    currentamount = currentamount + 1
                end
            end
        end
        for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
            if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
                local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
                if mag <= distance then -- magcheck
                    table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
                    currentamount = currentamount + 1
                end
            end
        end
    end
    return returnedplayer -- table of attackable entities
end

local germanthingy = false
function funianimthing()
    
end

local isclone = false

--[[function kickKillauraRemote()
    if (not isclone) then
        local mouse = game.Players.LocalPlayer:GetMouse()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if mag <= 20 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                    if v.Character:FindFirstChild("Head") then
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                            ["invisibleLandmine"] = v.Character.Head
                        })
                    end
                end
            end
        end 
    else
        local mouse = game.Players.LocalPlayer:GetMouse()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                local mag = (v.Character.HumanoidRootPart.Position - clone.HumanoidRootPart.Position).Magnitude
                if mag <= 20 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                    if v.Character:FindFirstChild("Head") then
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                            ["invisibleLandmine"] = v.Character.Head                
                        })
                    end
                end
            end
        end 
    end
end--]]

local function getItem(itemName)
	for i5, v5 in pairs(getinv(lplr)["items"]) do
		if v5["itemType"] == itemName then
			return v5, i5
		end
	end
	return nil
end

local function getwool()
	for i5, v5 in pairs(getinv(lplr)["items"]) do
		if v5["itemType"]:match("wool") or v5["itemType"]:match("grass") then
			return v5["itemType"], v5["amount"]
		end
	end	
	return nil
end

local Flamework = require(game.ReplicatedStorage["rbxts_include"]["node_modules"]["@flamework"].core.out).Flamework
repeat task.wait() until (Flamework.isInitialized)

runcode(function()
	local antivoidp
end)

local AntiVoid = World:NewSection("AntiVoid")
AntiVoid:NewToggle("AntiVoid", "Make you have ground on void", function(callback)
    if callback then
        local specialpos = (workspace.MapCFrames:FindFirstChild("center") and workspace.MapCFrames.center.Value.p == Vector3.new(77, 11, 35))
        AntiVoidP = Instance.new("Part")
        AntiVoidP.Parent = Workspace
        AntiVoidP.Name = "AntiVoid"
        AntiVoidP.CanCollide = true
        AntiVoidP.Size = Vector3.new(2048, 1, 2048)
        AntiVoidP.Anchored = true
        AntiVoidP.Transparency = 0.5
        AntiVoidP.Material = Enum.Material.Neon
        AntiVoidP.Color = Color3.fromRGB(0, 106, 236)
        AntiVoidP.Position = Vector3.new(0, 23.5, 0)
    else
        if AntiVoidP then
            AntiVoidP:Remove()
        end
    end
end)

AntiVoid:NewColorPicker("Color", "Change Antivoid color", Color3.fromRGB(255, 255, 255), function(col)
    if AntiVoidP then
        AntiVoidP.Color = (col)
    end
end)

local Sprint = Combat:NewSection("Sprint")
Sprint:NewToggle("Sprint", "Automatically press sprint", function(state)
	if state then
		BindToStepped("Sprint", 1, function()
			if SprintCont.sprinting == false then
				SprintCont:startSprinting()
			end
		end)
	else
		UnbindFromStepped("Sprint")
		SprintCont:stopSprinting()
	end
end)

local Aimassist = Combat:NewSection("Aim Assist")
Aimassist:NewToggle("Aim assist", "Aim assist", function(callback)
if callback then
                    aimbegan = uis.InputBegan:connect(function(input1)
                        if uis:GetFocusedTextBox() == nil and input1.UserInputType == Enum.UserInputType.MouseButton1 then
                            aimactive = true
                        end
                    end)
                    
                    aimended = uis.InputEnded:connect(function(input1)
                        if input1.UserInputType == Enum.UserInputType.MouseButton1 then
                            aimactive = false
                        end
                    end)

                    local function aimpos(vec, multiplier)
                        local newvec = (vec - uis:GetMouseLocation() - Vector2.new(0, 36)) * tonumber(multiplier)
                        mousemoverel(newvec.X, newvec.Y)
                    end

                    local aimmulti = findOption("AimAssist", "Smoothness")
                    BindToRenderStep("AimAssist", 1, function()
                        if aimactive then
                            local targettable = {}
                            local targetsize = 0
                            local plr = GetNearestHumanoidToPosition(true, 18)
                            if plr and getEquipped()["Type"] == "sword" and #bedwars["AppController"]:getOpenApps() <= 1 and isNotHoveringOverGui() and bedwars["SwordController"]:canSee({["instance"] = plr.Character, ["player"] = plr, ["getInstance"] = function() return plr.Character end}) and bedwars["KatanaController"].chargingMaid == nil then
                                local pos, vis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                                if vis and isrbxactive() then
                                    local senst = UserSettings():GetService("UserGameSettings").MouseSensitivity * (1 - (aimmulti.state / 100))
                                    aimpos(Vector2.new(pos.X, pos.Y), senst)
                                end
                                --cam.CFrame = cam.CFrame:lerp(CFrame.new(cam.CFrame.p, plr.Character.HumanoidRootPart.Position), (1 / AimSpeed["Value"]) - (AimAssistStrafe["Enabled"] and (uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.D)) and 0.01 or 0))
                            end
                        end
                    end)
                else
                    UnbindFromRenderStep("AimAssist")
                    aimbegan:Disconnect()
                    aimended:Disconnect()
                    aimactive = false
                end
            end)
            Aimassist:NewSlider("Smoothness", 0, 100, 100, function() end)
            local balloondebounce = false
            local autoballoon = Blatant:NewSection("Auto Ballon")
            autoballoon:NewToggle("AutoBalloon", "Inflates balloons after under a certain y level", function(callback)
                if callback then
                    local balloonylevel = findOption("AutoBalloon", "Y Level")
                    local balloondelay = findOption("AutoBalloon", "Delay")
                    spawn(function()
                        repeat
                            task.wait(0.1)
                            if isAlive() then
                                if (lplr.Character.HumanoidRootPart.Position.Y <= (balloonylevel.state - 100)) and lplr.Character.HumanoidRootPart.Velocity.Y <= -20 and balloondebounce == false then
                                    local oldhotbarslot = bedwars["ClientStoreHandler"]:getState().Inventory.observedInventory.hotbarSlot
                                    local balloonslot = getItemFromHotbar("balloon")
                                    if balloonslot then 
                                        balloondebounce = true
                                        for i = 1, 3 do
                                            bedwars["ClientStoreHandler"]:dispatch({
                                                type = "InventorySelectHotbarSlot", 
                                                slot = balloonslot
                                            })
                                            task.wait(balloondelay.state / 100)
                                            KnitClient.Controllers.BalloonController:inflateBalloon()
                                        end
                                        task.wait(balloondelay.state / 100)
                                        bedwars["ClientStoreHandler"]:dispatch({
                                            type = "InventorySelectHotbarSlot", 
                                            slot = oldhotbarslot
                                        })
                                        balloondebounce = false
                                    end
                                end
                            end
                        until modulesenabled["AutoBalloon"] == false
                    end)
                end
            end)

local Autoclicker = Combat:NewSection("Auto Clicker")

Autoclicker:NewToggle("AutoClick", "Enables auto clicking", function(callback)
if callback then
                    autoclickerconnection1 = uis.InputBegan:connect(function(input, gameProcessed)
                        if gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
                            autoclickermousedown = true
                        end
                    end)
                    autoclickerconnection2 = uis.InputEnded:connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            autoclickermousedown = false
                        end
                    end)
                    local cpsmodule = findOption("AutoClicker", "CPS")
                    spawn(function()
                        repeat
                            task.wait()
                            if isAlive() and autoclickermousedown and #bedwars["AppController"]:getOpenApps() <= 1 and isNotHoveringOverGui() and bedwars["KatanaController"].chargingMaid == nil then 
                                if getEquipped()["Type"] == "sword" then 
                                    spawn(function()
                                        bedwars["SwordController"]:swingSwordAtMouse()
                                        task.wait((1 / makerandom(math.clamp(cpsmodule.state - 2, 1, 9), cpsmodule.state)))
                                    end)
                                end
                                if getEquipped()["Type"] == "block" and modulesenabled["AutoClicker/Place Block"] and bedwars["BlockPlacementController"].blockPlacer then 
                                    local mouseinfo = bedwars["BlockPlacementController"].blockPlacer.clientManager:getBlockSelector():getMouseInfo(0)
                                    if mouseinfo then
                                        spawn(function()
                                            if bedwars["BlockPlacementController"].blockPlacer then
                                                bedwars["BlockPlacementController"].blockPlacer:placeBlock(mouseinfo.placementPosition)
                                            end
                                        end)
                                    end
                                    task.wait((1 / makerandom(math.clamp(cpsmodule.state - 2, 1, 20), cpsmodule.state)))
                                end
                            end
                        until modulesenabled["AutoClicker"] == false
                    end)
                else
                    if autoclickerconnection1 then
                        autoclickerconnection1:Disconnect()
                    end
                    if autoclickerconnection2 then
                        autoclickerconnection2:Disconnect()
                    end
                end
            end)
            Autoclicker:NewSlider("CPS", 1, 20, 10, function() end)
            Autoclicker:NewToggle("Place Block", "Auto clicker places blocks", function(callback) end)
            local autotoolconnection
            local autotool = Blatant:NewSection("Auto tool")
            autotool:NewToggle("AutoTool", "Switches tool to highlighted block", function(callback)
                if callback then
                   autotoolconnection = KnitClient.Controllers.BlockBreakController.blockBreaker.onBreak:Connect(function()
                        local mouseinfo = KnitClient.Controllers.BlockBreakController.blockBreaker.clientManager:getBlockSelector():getMouseInfo(1)
                        if mouseinfo and mouseinfo.target then
                            switchToAndUseTool(mouseinfo.target.blockInstance)
                        end
                   end)
                else
                    if autotoolconnection then
                        autotoolconnection:Disconnect()
                    end
                end
            end)

local Velocity = Combat:NewSection("Velocity")
Velocity:NewToggle("NoFallDamage", "Enable and dont take any fall damage", function(callback)
	local nofall = true

    if callback then

        if nofall then

            spawn(function()

                repeat

                    wait()

                    if nofall == false then

                        return end

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GroundHit:FireServer()

                    until nofall == false

                end)

            end

    else

        local nofall = false

    end
end)

Velocity:NewToggle("No KnockBack", "Prevents taking a knockback", function(state)
	if state then
		KnockbackTable["kbDirectionStrength"] = 0
		KnockbackTable["kbUpwardStrength"] = 0
	else
		KnockbackTable["kbDirectionStrength"] = 100
		KnockbackTable["kbUpwardStrength"] = 100
	end
end)

local Speed = Blatant:NewSection("Cframe")
Speed:NewToggle("CFrame", "Anticheat cframe speed", function(state)
	if state then
		BindToStepped("CFrameWalkSpeed", 1, function(time, delta)
			if entity.isAlive then
				local newpos = (lplr.Character.Humanoid.MoveDirection  * (speedval["Value"] - lplr.Character.Humanoid.WalkSpeed)) * delta

				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
				if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
			end
		end)
	else
		UnbindFromStepped("CFrameWalkSpeed")
	end
end)

local Reach = Blatant:NewSection("Reach")
Reach:NewToggle("Reach", "Enables more range for your item", function(state)
	if state then
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
	else
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
	end
end)

Reach:NewSlider("Range 18-1", "Range changer", 18, 1, function(val)
	reachval["Value"] = val
end)

local Keyboard = Render:NewSection("Keyboard")
Keyboard:NewButton("Keyboard", "Keyboard script", function()
loadstring(game:HttpGet("https://pastebin.com/raw/kC3dAMvt"))()
end)

local RektskyAmbience = World:NewSection("RektskyAmbience")
RektskyAmbience:NewToggle("RektskyAmbience", "RektskyAmbience", function(state)
            if state then
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
        end
end)

local FixCam = Render:NewSection("FixCam")
FixCam:NewButton("FixCam", "fix camera bug on mobile", function()
	cam.CameraType = Enum.CameraType.Fixed
	cam.CameraType = Enum.CameraType.Custom
end)

Speed:NewSlider("Speed 1-42", "Adjust CFrame to your speed", 42, 1, function(s)
	speedval["Value"] = s
end)

local flyrektsky
local flyrektsky = Blatant:NewSection("Fly [RektSky]")
flyrektsky:NewToggle("Fly", "you can Fly", function(state)
  if state then
    flyrektsky = state
            if flyrektsky then
                spawn(function()
                    repeat
                        task.wait()
                        if clone then
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                clone.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        else
                            task.wait()
                            workspace.Gravity = 1
                            local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                            local ShiftHeld = uis:IsKeyDown(Enum.KeyCode.LeftShift)
                            if SpaceHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, 15, 0)
                                task.wait()
                            end
                            if ShiftHeld then
                                hrp.CFrame = hrp.CFrame * CFrame.new(0, -15, 0)
                                task.wait()
                            end
                        end
                    until (not flyrektsky)
                end)
            else
                conectthingylol:Disconnect()
            end
       end
end)

local yes
local yestwo
local sussyfunnything
local sussything = false
local scafffold = Render:NewSection("Scaffold")
scafffold:NewToggle("Auto place blocks underneath", "Auto place blocks if you walk", function(state)
    if state then
      sussythingy = state
        if (sussythingy) and entity.isAlive then
            spawn(function()
                yestwo = RunService.Heartbeat:Connect(function(step)
                    if (not sussythingy) then return end
                    local y = lplr.Character.HumanoidRootPart.Position.y
                    local x = lplr.Character.HumanoidRootPart.Position.x
                    local z = lplr.Character.HumanoidRootPart.Position.z
                    local blockpos = getScaffold((lplr.Character.Head.Position) + Vector3.new(1, -math.floor(lplr.Character.Humanoid.HipHeight * 3), 0) + lplr.Character.Humanoid.MoveDirection)
                    placeblockthing(blockpos, getwool())
                end)
            end)
        else
            yestwo:Disconnect()
        end
    end
  end)

local breakallbedsthing
local BreakAllBed = Blatant:NewSection("Break All Beds")
BreakAllBed:NewToggle("Break All Beds", "Break every bed", function(state)
             local amogusvalue = state
             if amogusvalue then
            pcall(function()
                for i = 1,15 do
                    for i, v in pairs(game.Workspace.Map.Blocks:GetChildren()) do
                        if v.Name == "bed" then
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                ["invisibleLandmine"] = v                    
                            })
                        end
                    end
                end
            end)
            breakallbedsthing:silentToggle()
        end
     end)

local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false

local Skyss = Utility:NewSection("Skys Hide Username")
Skyss:NewButton("Hide Username", "Hide Username", function()
local Options = { -- Configuration Options
    RenameTo = "HyperlineUser", -- What to rename your player to
    UserId = 1, -- The userid of the player, you want your player to appear as in images
}


local textService = game:GetService("TextService")
local lplr = game:GetService("Players").LocalPlayer

local function x(v) 
    local removed = v:gsub(lplr.Name, Options.RenameTo)
    :gsub(tostring(lplr.UserId), tostring(Options.UserId)) -- big thanks to engo for lines 16-37
    :gsub(lplr.DisplayName, Options.RenameTo)
    return removed
end

local function replace(v) 
    if pcall(function() return v.Text end) and typeof(v.Text)=="string" then
        local y = x(v.Text)
        v.Text = y
        v:GetPropertyChangedSignal("Text"):connect(function() 
            v.Text = x(v.Text)
        end)
        return y
    end    
    if pcall(function() return v.Image end) and typeof(v.Image)=="string" then 
        local y = x(v.Image)
        v.Image = y
        v:GetPropertyChangedSignal("Image"):connect(function() 
            v.Image = x(v.Image)
        end)
        return y
    end
    return v
end


local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local ncm = getnamecallmethod()
    if ncm == "GetTextSize" and self == textService then 
        args[1] = replace(args[1])    
    end
    return oldnamecall(self, table.unpack(args))
end)

for i,v in next, game:GetDescendants() do 
    replace(v)
end

game.DescendantAdded:Connect(function(v)
    replace(v)
end)
end)

local ShopTierBypass = Utility:NewSection("ShopTierBypass")
ShopTierBypass:NewToggle("Shop Bypass", "Unlock every tier in shop", function(state)
  if state then
   if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
        else
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = oldtiered
                v.nextTier = oldnexttier
            end
        end
    end
end)

local hackdetector = false
local HackerDetected = Utility:NewSection("HackerDetected")
HackerDetected:NewToggle("HackerDetected", "idk", function(v)
     if v then
               hackdetector = v
            if hackdetector then
                repeat task.wait() until (matchState == 2)
                spawn(function()
                    repeat
                        task.wait()
                        if (not hackdetector) then return end
                        for i, v in pairs(game.Players:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") then
                                local oldpos = v.Character.HumanoidRootPart.Position
                                task.wait(0.5)
                                local newpos = Vector3.new(v.Character.HumanoidRootPart.Position.X, 0, v.Character.HumanoidRootPart.Position.Z)
                                local realnewpos = math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude) * 2
                                if realnewpos > 32 then
                                    game:GetService("StarterGui"):SetCore("SendNotification", {
                                        Title = v.Name.." is cheating",
                                        Text = tostring(math.floor((newpos - Vector3.new(oldpos.X, 0, oldpos.Z)).magnitude)),
                                        Duration = 5,
                                    })
                                end
                            end
                        end
                    until (not hackdetector)
                end)
            end
        end
      end)

local tpwalk = Render:NewSection("Tp Walk")
tpwalk:NewButton("Tp Walk", "Tp Walk", function()
local a=game.Players.LocalPlayer;spawn(function()while true do a.Character:TranslateBy(a.Character.Humanoid.MoveDirection*1.03)wait()end end)
end)

local TpAura
local tpauralmao
local TpAura = Render:NewSection("TpAura")
TpAura:NewToggle("TpAura", "tp killed", function(state)
	if state then
		TpAura = state
        repeat task.wait() until (matchState == 1)
        secondclonemake()
        if matchState == 1 then
            spawn(function()
                if TpAura and entity.isAlive then
                    if entity.isAlive then
                        repeat
                            wait()
                            if (not TpAura) then return end
                            spawn(function()
                                wait()
                                local mouse = game.Players.LocalPlayer:GetMouse()
                                for i,v in pairs(game.Players:GetChildren()) do
                                    if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
                                        local mag = (v.Character.HumanoidRootPart.Position - clonetwo.HumanoidRootPart.Position).Magnitude
                                        if mag <= 20 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                                            if v.Character:FindFirstChild("Head") then
                                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                                    ["invisibleLandmine"] = v.Character.Head                                        
                                                })
                                            end
                                        end
                                    end
                                end 
                            end)
                            spawn(function()
                                local plrthing = GetAllNearestHumanoidToPosition(600, 1)
                                for i, plr in pairs(plrthing) do
                                    clonetwo.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                                    wait(0.6)
                                    clonetwo.HumanoidRootPart.CFrame = clone.HumanoidRootPart.CFrame
                                    wait(0.6)
                                end
                            end)
                            spawn(function()
                                repeat task.wait() until (matchState == 2)
                                tpauralmao:Toggle()
                            end)
                        until (not TpAura)
                    end
                else
                    clonetwo:remove()
                    return
                end
            end)
        end
    end
end)

local fov = Render:NewSection("Fov")
fov:NewToggle("Fov", "Change Your Fov", function(state)
    if state then
workspace.CurrentCamera.FieldOfView = 120
    else
workspace.CurrentCamera.FieldOfView = 80
    end
end)

fov:NewSlider("Fov Changer", "nova6 is trash", 120, 70, function(s) -- 500 (MaxValue) | 0 (MinValue)
    workspace.CurrentCamera.FieldOfView = s
end)

local Killaura = Blatant:NewSection("Killaura")
Killaura:NewToggle("KillAura", "Autoswing the sword if someone is near you", function(state)
	if state then
		BindToStepped("Killaura", 1, function()
			if entity.isAlive then
				KillauraRemote()
			end
		end)
	else
		UnbindFromStepped("Killaura")
	end
end)

Killaura:NewSlider("Distance 1-20", "Adjust killaura distance", 20, 1, function(val)
	DistVal["Value"] = val
end)

Killaura:NewToggle("No Swing", "Disable swing of the killaura", function(state)
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)

Killaura:NewSlider("Sound 1-0", "Adjust killaura sound", 1, 0, function(val)
	killaurasoundval["Value"] = val
end)

function getbedsxd()
    local beds = {}
    local blocks = game:GetService("Workspace").Map.Worlds[lcmapname].Blocks
    for _,Block in pairs(blocks:GetChildren()) do
        if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
            table.insert(beds,Block)
        end
    end
    return beds
end

function getbedsblocks()
    local blockstb = {}
    local blocks = game:GetService("Workspace").Map.Worlds[lcmapname].Blocks
    for i,v in pairs(blocks:GetChildren()) do
        if v:IsA("Part") then
            table.insert(blockstb,v)
        end
    end
    return blockstb
end

function blocks(bed)
    local aboveblocks = 0
    local Blocks = getbedsblocks()
    for _,Block in pairs(Blocks) do
        if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
            aboveblocks = aboveblocks + 1
        end
    end
    return aboveblocks
end

function nuker()
    local beds = getbedsxd()
    for _,bed in pairs(beds) do
        local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        if bedmagnitude < 27 then
            local upnum = blocks(bed.Position)
            local x = math.round(bed.Position.X/3)
            local y = math.round(bed.Position.Y/3) + upnum
            local z = math.round(bed.Position.Z/3)
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(x,y,z)
                },
                ["hitPosition"] = Vector3.new(x,y,z),
                ["hitNormal"] = Vector3.new(x,y,z),
            })
        end
    end
end

--[[function funinuker()
    if (not isclone) then
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    else
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - clone.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    end
end-]]

local BNuker = Blatant:NewSection("Bed nuker")
BNuker:NewToggle("Bed nuker", "Auto breaks beds near you", function(v)
	local bedrekterval = v
        if bedrekterval then
            spawn(function()
                repeat
                    wait()
                    if entity.isAlive then
                        wait(0.25)
                        if (not bedrekterval) then return end
                        nuker()
                    end
                until (not bedrekterval)
            end)
        end
    end)

local Infjump = Blatant:NewSection("Infjump")
Infjump:NewToggle("Infjump", "Allows you to hold space to fly up", function(state)
	if state then
		local InfJump = {["Enabled"] = true}
		connectioninfjump = uis.JumpRequest:connect(function(jump)
			if InfJump["Enabled"] then
				lplr.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	else
		connectioninfjump:Disconnect()
	end
end)

runcode(function()
	local wall = nil
	local spiderspeed = {["Value"] = 0}
	local Spider = Blatant:NewSection("Spider")
	Spider:NewToggle("Spider", "Allows you to climb up a wall", function(state)
		if state then
			BindToStepped("Spider", 1, function()
				local raycastparameters = RaycastParams.new()
				raycastparameters.FilterDescendantsInstances = {lplr.Character}
				local ray = workspace:Raycast(lplr.Character.Humanoid.LeftLeg.Position, lplr.Character.HumanoidRootPart.CFrame.LookVector * 1.3, raycastparameters)

				wall = ray and ray.Instance or nil
				if wall then
					lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X or 0, spiderspeed["Value"], lplr.Character.HumanoidRootPart.Velocity.Z or 0)

					if lplr.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
						lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
					end
				end
			end)
		else
			UnbindFromStepped("Spider")
		end
	end)
	Spider:NewSlider("Speed", "Adjust spider speed", 100, 0, function(val) -- 500 (MaxValue) | 0 (MinValue)
		spiderspeed["Value"] = val
	end)
end)

local Gravity = Blatant:NewSection("Gravity")

Gravity:NewToggle("Low Gravity", "Enables Low Gravity", function(state)
       if state then
           game.Workspace.Gravity = 10
      else
        game.Workspace.Gravity = 196
       end
end)

Gravity:NewSlider("Gravity", "Gravity", 70, 0, function(val)
workspace.gravity = val
end)

local McSound = Blatant:NewSection("McSound")
McSound:NewButton("McSound", "Enable mcsound", function()
function yesyesbed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        local sound = Instance.new("Sound")
        sound.Parent = workspace
        sound.SoundId = getasset("rektsky/sound/mc/bedbroken.mp3")
        sound:Play()
        wait(7)
        sound:remove()
    end
end

local gamesound = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound
            spawn(function()
                lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesyesbed)
            end)
            spawn(function()
                Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                    p13:Connect(function(p14)
                        local sound = Instance.new("Sound")
                        sound.Parent = workspace
                        sound.SoundId = getcustomassetfunc("rektsky/sound/mc/bedbreak.mp3")
                        sound:Play()
                        wait(4)
                        sound:remove()
                    end)
                end)
            end)
            local oldsounds = gamesound
            local newsounds = gamesound
            newsounds.UI_CLICK = "rbxassetid://535716488"
            newsounds.PICKUP_ITEM_DROP = getcustomassetfunc("rektsky/sound/mc/pickup.mp3")
            newsounds.KILL = "rbxassetid://1053296915"
            newsounds.ERROR_NOTIFICATION = ""
            newsounds.DAMAGE_1 = "rbxassetid://6361963422"
            newsounds.DAMAGE = "rbxassetid://6361963422"
            newsounds.DAMAGE_2 = "rbxassetid://6361963422"
            newsounds.DAMAGE_3 = "rbxassetid://6361963422"
            newsounds.SWORD_SWING_1 = ""
            newsounds.SWORD_SWING_2 = ""
            newsounds.BEDWARS_PURCHASE_ITEM = getcustomassetfunc("rektsky/sound/mc/buyitem.mp3")
            newsounds.STATIC_HIT = "rbxassetid://6361963422"
            newsounds.STONE_BREAK = "rbxassetid://6496157434"
            newsounds.WOOL_BREAK = getcustomassetfunc("rektsky/sound/mc/woolbreak.mp3")
            newsounds.WOOD_BREAK = getcustomassetfunc("rektsky/sound/mc/breakwood.mp3")
            newsounds.GLASS_BREAK = getcustomassetfunc("rektsky/sound/mc/glassbreak.mp3")
            newsounds.TNT_HISS_1 = getcustomassetfunc("rektsky/sound/mc/tnthiss.mp3")
            newsounds.TNT_EXPLODE_1 = getcustomassetfunc("rektsky/sound/mc/tntexplode.mp3")
            gamesound = newsounds
end)

Toxic:NewButton("Spam", "Spams our name", function()
local Event = game.ReplicatedStorage.NotificationCards.Event; Event:Fire("Notify", "Mail");
Event:Fire("Notify", { 	
Name = "Info"; 	
Title = "Loading Spam"; 	
Body = "Please wait patiently."; 	
Sound = "Ping"; 	
Color = Color3.fromRGB(89, 121, 81) 
});
while true do wait(1)

local A_1 = "SUNTAI ON TOP!" local A_2 = "All" 

local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) end

end)


--Suntai autotoxic

function yesoksussybed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Who ever broke my bed, i have your location", 'All')
    end
end

Toxic:NewButton("AutoToxic", "amogus", function(state)
     local Event = game.ReplicatedStorage.NotificationCards.Event; Event:Fire("Notify", "Mail");
Event:Fire("Notify", { 	
Name = "Info"; 	
Title = "Loading AutoToxic"; 	
Body = "Please wait patiently."; 	
Sound = "Ping"; 	
Color = Color3.fromRGB(89, 121, 81) 
});  
 spawn(function()  
                getgenv().autotoxicval = state
            Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
                p6:Connect(function(p7)
                    if p7.fromEntity == lplr.Character then
                        if not getgenv().autotoxicval then return end
                        if getgenv().autotoxicval then
                            local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                            local toxicmessages = {"dude, "..susplr.Name.."Please Go get Suntai you so bad ", "get better "..susplr.Name.."!", susplr.Name.."imagine not use Suntai ", "Get Suntai if you want to better "..susplr.Name.."WOW Suntai GZMING CHAIR IS SO GOOD", "Heheha "..susplr.Name..", L BOZO", "cope "..susplr.Name, "omg Am So Good Better than yoy mom", "noob "..susplr.Name, "hey bro "..susplr.Name.." Get Suntai", "No Life?? get Suntai"..susplr.Name.." Well Good", "Suntai is just good bro have god CHAIR", "ez L "..susplr.Name, "L "..susplr.Name, "Bow Spam? TRY IT HIT ME "..susplr.Name, "Suntai Number 1", "Suntai On top", "omg am just new guys please Am New "..susplr.Name, "Who Bad lala L "..susplr.Name}
                            local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                            if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                thirdlast = secondlast
                                secondlast = last
                                last = randomtoxicmessage
                            else
                                local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                                local toxicmessages = {"dude, "..susplr.Name.."Please Go get Suntai you so bad ", "get better "..susplr.Name.."!", susplr.Name.."imagine not use Suntai ", "Get Suntai if you want to better "..susplr.Name.."WOW Suntai GZMING CHAIR IS SO GOOD", "Heheha "..susplr.Name..", L BOZO", "cope "..susplr.Name, "omg Am So Good Better than yoy mom", "noob "..susplr.Name, "hey bro "..susplr.Name.." Get Suntai", "No Life?? get Suntai"..susplr.Name.." Well Good", "Suntai is just good bro have god CHAIR", "ez L "..susplr.Name, "L "..susplr.Name, "Bow Spam? TRY IT HIT ME "..susplr.Name, "Suntai Number 1", "Suntai On top", "omg am just new guys please Am New "..susplr.Name, "Who Bad lala L "..susplr.Name}
                                local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                                if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                    thirdlast = secondlast
                                    secondlast = last
                                    last = randomtoxicmessage
                                end
                            end
                        end
                    end
                end)        
            end)
        end)
        spawn(function()
            getgenv().valspeed = state
            if getgenv().valspeed then
                spawn(function()
                    Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                        p13:Connect(function(p14)
                            if p14.player.UserId == lplr.UserId then
                                local team = queuemeta[clntstorehandlr:getState().Game.queueType or "bedwars_test"].teams[tonumber(p14.brokenBedTeam.id)]
                                local teamname = team and team.displayName:lower() or "white"
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("wait SytroBed GIVE ME "..teamname.." :>>>", 'All')
                            end
                        end)
                    end)
                end)
            end
        end)
        spawn(function()
            lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesoksussybed)
        end)
end)

Esp:NewLabel("Only use one!")

Esp:NewButton("Tracer Esp", "Enables Tracer Esp", function()
local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = false -- Use True or False to toggle TeamCheck

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(255, 0, 0)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)
end)

Esp:NewButton("Skeleton Esp", "Enables skeleton esp", function()
local function addskeletonesp(player)
    spawn(function()
        local supported = true
        local parttbl = {"Head", "LowerTorso", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg", "RightFoot", "LeftFoot", "LeftUpperArm", "RightUpperArm", "RightLowerArm", "LeftLowerArm", "LeftHand", "RightHand"}
        for i,v in pairs(parttbl) do
            if player.Character:FindFirstChild(v) == nil then
                supported = false
            end
        end
        if supported then
            function createline(from, to)
                local Camera = Workspace.CurrentCamera
                local Line = Drawing.new("Line")
                Line.Visible = true
                Line.From = Vector2.new(from.X, from.Y)
                Line.To = Vector2.new(to.X, to.Y)
                Line.Color = Color3.fromRGB(0, 255, 0)
                Line.Thickness = 1.5
                Line.Transparency = 1
                return Line
            end
            
            function getpos(pos)
                return Vector2.new(pos.X, pos.Y)
            end
            
            local Camera = Workspace.CurrentCamera
            
            local TopTorso = Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.7,0))
            local BottomTorso = Camera:WorldToViewportPoint(player.Character.LowerTorso.Position - Vector3.new(0,0.2,0))
            
            local MainLine = createline(TopTorso, BottomTorso)
            
            local RightLeg = Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position + Vector3.new(0,0.2,0))
            local RightLegLine = createline(BottomTorso, RightLeg)
            
            local LeftLeg = Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position + Vector3.new(0,0.2,0))
            local LeftLegLine = createline(BottomTorso, LeftLeg)
            
            local RightKnee = Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position + Vector3.new(0,0.2,0))
            local RightKneeLine = createline(RightLeg, RightKnee)
            
            local LeftKnee = Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position + Vector3.new(0,0.2,0))
            local LeftKneeLine = createline(LeftLeg, LeftKnee)
            
            local RightFoot = Camera:WorldToViewportPoint(player.Character.RightFoot.Position)
            local RightFootLine = createline(RightKnee, RightFoot)
            
            local LeftFoot = Camera:WorldToViewportPoint(player.Character.LeftFoot.Position)
            local LeftFootLine = createline(LeftKnee, LeftFoot)
            
            local LeftArm = Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position + Vector3.new(0,0.2,0))
            local LeftLine = createline(TopTorso, LeftArm)
            
            local RightArm = Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position + Vector3.new(0,0.2,0))
            local RightLine = createline(TopTorso, RightArm)
            
            local RightElbow = Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position + Vector3.new(0,0.2,0))
            local RightElbowLine = createline(RightArm, RightElbow)
            
            local LeftElbow = Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position + Vector3.new(0,0.2,0))
            local LeftElbowLine = createline(LeftArm, LeftElbow)
            
            local LeftHand = Camera:WorldToViewportPoint(player.Character.LeftHand.Position)
            local LeftHandLine = createline(LeftElbow, LeftHand)
            
            local RightHand = Camera:WorldToViewportPoint(player.Character.RightHand.Position)
            local RightHandLine = createline(RightElbow, RightHand)
            
            game:GetService("RunService").RenderStepped:Connect(function()
                local Camera = Workspace.CurrentCamera
                if player.Character ~= nil and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil and player.Character:FindFirstChild("Humanoid").Health > 0 then
                    local Vector, onScreen = Camera:worldToViewportPoint(player.Character.HumanoidRootPart.Position)
                    
                    local TopTorso = Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.7,0))
                    local BottomTorso = Camera:WorldToViewportPoint(player.Character.LowerTorso.Position - Vector3.new(0,0.2,0))
                    local RightLeg = Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position + Vector3.new(0,0.2,0))
                    local LeftLeg = Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position + Vector3.new(0,0.2,0))
                    local RightKnee = Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position + Vector3.new(0,0.2,0))
                    local LeftKnee = Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position + Vector3.new(0,0.2,0))
                    local RightFoot = Camera:WorldToViewportPoint(player.Character.RightFoot.Position)
                    local LeftFoot = Camera:WorldToViewportPoint(player.Character.LeftFoot.Position)
                    local LeftArm = Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position + Vector3.new(0,0.2,0))
                    local RightArm = Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position + Vector3.new(0,0.2,0))
                    local RightElbow = Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position + Vector3.new(0,0.2,0))
                    local LeftElbow = Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position + Vector3.new(0,0.2,0))
                    local LeftHand = Camera:WorldToViewportPoint(player.Character.LeftHand.Position)
                    local RightHand = Camera:WorldToViewportPoint(player.Character.RightHand.Position)
                    
                    RightFootLine.From = getpos(Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position + Vector3.new(0,0.2,0)))
                    LeftFootLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position + Vector3.new(0,0.2,0)))
                    LeftKneeLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position + Vector3.new(0,0.2,0)))
                    RightKneeLine.From = getpos(Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position + Vector3.new(0,0.2,0)))
                    RightLegLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LowerTorso.Position - Vector3.new(0,0.2,0)))
                    LeftLegLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LowerTorso.Position - Vector3.new(0,0.2,0)))
                    LeftHandLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position + Vector3.new(0,0.2,0)))
                    RightHandLine.From = getpos(Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position + Vector3.new(0,0.2,0)))
                    MainLine.From = getpos(Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.7,0)))
                    LeftLine.From = getpos(Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.7,0)))
                    RightLine.From = getpos(Camera:WorldToViewportPoint(player.Character.Head.Position - Vector3.new(0,0.7,0)))
                    RightElbowLine.From = getpos(Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position + Vector3.new(0,0.2,0)))
                    LeftElbowLine.From = getpos(Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position + Vector3.new(0,0.2,0)))
                    
                    RightFootLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightFoot.Position))
                    LeftFootLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftFoot.Position))
                    LeftKneeLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftLowerLeg.Position + Vector3.new(0,0.2,0)))
                    RightKneeLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightLowerLeg.Position + Vector3.new(0,0.2,0)))
                    RightLegLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightUpperLeg.Position + Vector3.new(0,0.2,0)))
                    LeftLegLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftUpperLeg.Position + Vector3.new(0,0.2,0)))
                    LeftHandLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftHand.Position))
                    RightHandLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightHand.Position))
                    MainLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LowerTorso.Position - Vector3.new(0,0.2,0)))
                    LeftLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftUpperArm.Position + Vector3.new(0,0.2,0)))
                    RightLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightUpperArm.Position + Vector3.new(0,0.2,0)))
                    RightElbowLine.To = getpos(Camera:WorldToViewportPoint(player.Character.RightLowerArm.Position + Vector3.new(0,0.2,0)))
                    LeftElbowLine.To = getpos(Camera:WorldToViewportPoint(player.Character.LeftLowerArm.Position + Vector3.new(0,0.2,0)))
                    
                    if onScreen then
                        RightFootLine.Visible = true
                        LeftFootLine.Visible = true
                        LeftKneeLine.Visible = true
                        RightKneeLine.Visible = true
                        RightLegLine.Visible = true
                        LeftLegLine.Visible = true
                        LeftHandLine.Visible = true
                        RightHandLine.Visible = true
                        MainLine.Visible = true
                        LeftLine.Visible = true
                        RightLine.Visible = true
                        RightElbowLine.Visible = true
                        LeftElbowLine.Visible = true
                    else
                        RightFootLine.Visible = false
                        LeftFootLine.Visible = false
                        LeftKneeLine.Visible = false
                        RightKneeLine.Visible = false
                        RightLegLine.Visible = false
                        LeftLegLine.Visible = false
                        LeftHandLine.Visible = false
                        RightHandLine.Visible = false
                        MainLine.Visible = false
                        LeftLine.Visible = false
                        RightLine.Visible = false
                        RightElbowLine.Visible = false
                        LeftElbowLine.Visible = false
                    end
                else
                    RightFootLine:Remove()
                    LeftFootLine:Remove()
                    LeftKneeLine:Remove()
                    RightKneeLine:Remove()
                    RightLegLine:Remove()
                    LeftLegLine:Remove()
                    LeftHandLine:Remove()
                    RightHandLine:Remove()
                    MainLine:Remove()
                    LeftLine:Remove()
                    RightLine:Remove()
                    RightElbowLine:Remove()
                    LeftElbowLine:Remove()
                end
            end)
        end
    end)
end
for i,v in pairs(game.Players:GetChildren()) do
    addskeletonesp(v)
end
end)

Esp:NewButton("Box Esp", "Enables Box Esp", function()
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()

local function Dist(pointA, pointB) -- magnitude errors for some reason  : (
    return math.sqrt(math.pow(pointA.X - pointB.X, 2) + math.pow(pointA.Y - pointB.Y, 2))
end

local function GetClosest(points, dest)
    local min  = math.huge 
    local closest = nil
    for _,v in pairs(points) do
        local dist = Dist(v, dest)
        if dist < min then
            min = dist
            closest = v
        end
    end
    return closest
end

local function DrawESP(plr)
    local Box = Drawing.new("Quad")
    Box.Visible = false
    Box.PointA = Vector2.new(0, 0)
    Box.PointB = Vector2.new(0, 0)
    Box.PointC = Vector2.new(0, 0)
    Box.PointD = Vector2.new(0, 0)
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 2
    Box.Transparency = 1

    local function Update()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local pos, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then 
                    local points = {}
                    local c = 0
                    for _,v in pairs(plr.Character:GetChildren()) do
                        if v:IsA("BasePart") then
                            c = c + 1
                            local p = Camera:WorldToViewportPoint(v.Position)
                            if v.Name == "HumanoidRootPart" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
                            elseif v.Name == "Head" then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
                            elseif string.match(v.Name, "Left") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
                            elseif string.match(v.Name, "Right") then
                                p = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
                            end
                            points[c] = p
                        end
                    end
                    local Left = GetClosest(points, Vector2.new(0, pos.Y))
                    local Right = GetClosest(points, Vector2.new(Camera.ViewportSize.X, pos.Y))
                    local Top = GetClosest(points, Vector2.new(pos.X, 0))
                    local Bottom = GetClosest(points, Vector2.new(pos.X, Camera.ViewportSize.Y))

                    if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
                        Box.PointA = Vector2.new(Right.X, Top.Y)
                        Box.PointB = Vector2.new(Left.X, Top.Y)
                        Box.PointC = Vector2.new(Left.X, Bottom.Y)
                        Box.PointD = Vector2.new(Right.X, Bottom.Y)

                        Box.Visible = true
                    else 
                        Box.Visible = false
                    end
                else 
                    Box.Visible = false
                end
            else
                Box.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    c:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
    if v.Name ~= Player.Name then 
        DrawESP(v)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    DrawESP(v)
end)
end)

Esp:NewButton("Name Esp", "Enables name esp", function()
local esp_settings = { ---- table for esp settings 
    textsize = 8,
    colour = 255,255,255
}
 
local gui = Instance.new("BillboardGui")
local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel
 
 
 
gui.Name = "Cracked esp"; ---- properties of the esp
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(esp_settings.colour)
esp.BorderSizePixel = 0
esp.Font = "GothamSemibold"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
 
game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then -- craeting checks for team check, local player etc
            esp.Text = "{"..v.Name.."}"
            gui:Clone().Parent = v.Character.Head
    end
end
end)
end)

Animation:NewButton("Astronaut", "Anstronaut Animation", function()
    print("Astronaut Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
 
wait(1)
end
end
end)

Animation:NewButton("Bubbly", "Bubbly Animation", function()
    print("Bubbly Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
 
wait(1)
end
end
end)

Animation:NewButton("Cartoony", "Cartoony Animation", function()
    print("Cartoony Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
 
wait(1)
end
end
end)

Animation:NewButton("Elder", "Elder Animation", function()
    print("Elder Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
 
wait(1)
end
end
end)

Animation:NewButton("Knight", "Knight Animation", function()
    print("Knight Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
 
wait(1)
end
end
end)

Animation:NewButton("Levitation", "Levitation Animation", function()
    print("Levitation Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
 
wait(1)
end
end
end)

Animation:NewButton("Mage", "Mage Animation", function()
    print("Mage Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
 
wait(1)
end
end
end)

Animation:NewButton("Ninja", "Ninja Animation", function()
    print("Ninja Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
 
wait(1)
end
end
end)

Animation:NewButton("Pirate", "Pirate Animation", function()
    print("Pirate Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
 
wait(1)
end
end
end)

Animation:NewButton("Robot", "Robot Animation", function()
    print("Robot Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
 
wait(1)
end
end
end)

Animation:NewButton("Stylish", "Stylish Animation", function()
    print("Stylish Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
 
wait(1)
end
end
end)

Animation:NewButton("Superhero", "Superhero Animation", function()
    print("Superhero Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
 
wait(1)
end
end
end)

Animation:NewButton("Toy", "Toy Animation", function()
    print("Toy Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
 
wait(1)
end
end
end)

Animation:NewButton("Vampire", "Vampire Animation", function()
    print("Vampire Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
 
wait(1)
end
end
end)

Animation:NewButton("Werewolf", "Werewolf Animation", function()
    print("Werewolf Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
 
wait(1)
end
end
end)

Animation:NewButton("Zombie", "Zombie Animation", function()
    print("Zombie Animation Succesfull!")
    while true do
    wait(1)
    for i, player in ipairs(game.Players:GetChildren()) do
    local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
 
wait(1)
end
end
end)

local Extra = Window:NewTab("Extras")

local cloneval = false
local CloneGodModeFulldisablertroll
local CloneGodModeFulldisablertroll = Extra:NewSection("CloneGodModeFulldisablertroll")
CloneGodModeFulldisablertroll:NewToggle("Clone Godmode", "Troll ppl fe and can kill too", function(state)
   if state then
       cloneval = state
            if cloneval then
                spawn(function()
                    isclone = true
                    clonemake()
                    speedd = 200
                    connectionnnn = game:GetService("RunService").Heartbeat:connect(function()
                        local velo = clone.Humanoid.MoveDirection * speedd
                        clone.HumanoidRootPart.Velocity = Vector3.new(velo.x, lplr.Character.HumanoidRootPart.Velocity.y, velo.z)
                    end)
                end)
                repeat task.wait() until (matchState == 2)
                funiclonegodmodedisab:Toggle()
            else
                clone:remove()
                lplr.Character = realchar
                realchar.Humanoid:ChangeState("Dead")
                isclone = false
                connectionnnn:Disconnect()
                return
            end
   end
end)

  local funikillallthingy
local MovementDisabled = Extra:NewSection("MovementDisabled")
MovementDisabled:NewToggle("Movement Disabled", "Enables movement disabled", function(state)
  if state then
     local amogusssvalue = state
        if amogusssvalue then
            pcall(function()
                for i = 1,15 do
                    for i, v in pairs(game.Players:GetChildren()) do
                        if v ~= lplr then
                            if v.Character.HumanoidRootPart then
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                                    ["invisibleLandmine"] = v                        
                                })
                            end
                        end
                    end
                end
            end)
            funikillallthingy:silentToggle()
        end
    end
end)

local Skys = Extra:NewSection("Skys Anticheat")
Skys:NewButton("Skys anticheat", "Skys anticheat", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/joke%20anticheat.lua'),true))()
end)

local Vamp = Extra:NewSection("Vamps Anticheat")
Vamp:NewButton("Vamps anticheat", "Enables vamp anticheat", function()
local lplr = game:GetService("Players").LocalPlayer
local cam = workspace.CurrentCamera
local oldchar
local clonechar

oldchar = lplr.Character
oldchar.Archivable = true

clonechar = oldchar:Clone()
oldchar.HumanoidRootPart.Anchored = false

game:GetService("RunService").Stepped:connect(function()
oldchar:SetPrimaryPartCFrame(clonechar.PrimaryPart.CFrame)
end)
end)

local amongusmodel = Extra:NewSection("Amongus Character")
amongusmodel:NewButton("Amongus Character Model", "Amongus Character Model", function()
function Transparency(number)
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character then
            for _,c in pairs(v.Character:GetDescendants()) do
                if not c.Parent.Name:match("sword") or c.Parent.Name:match("pickaxe") or c.Parent.Name:match("axe") then
                    if c:IsA("BasePart") or c:IsA("Decal") and c.Name ~= "HumanoidRootPart" then
                        c.Transparency = number
                        v.Character.PrimaryPart.Transparency = 1
                    end
                end
            end
        end
    end
end

function addcustommodel(player,Model)
    if Model == "Amogus" then
        if not game.Workspace:FindFirstChild("CustomFolderv") then
            local customfolder = Instance.new("Folder",game:GetService("Workspace"))
            customfolder.Name = "CustomFolderv"
        end
        if not game.Workspace.CustomFolderv:FindFirstChild(player.Name) then
            local customfolder = game.Workspace.CustomFolderv
            local newmesh = Instance.new("MeshPart",customfolder)
            newmesh.CanCollide = false
            newmesh.Massless = true
            newmesh.MeshId = "rbxassetid://8760585445"
            newmesh.Size = Vector3.new(0.1367, 0.1213, 0.133)
            newmesh.CFrame = player.Character.HumanoidRootPart.CFrame
            local weld = Instance.new("WeldConstraint",newmesh)
            weld.Part0 = player.Character.HumanoidRootPart
            weld.Part1 = newmesh
            newmesh.Name = player.Name
        end
    end
end

Transparency(1)
for i,v in pairs(game.Players:GetChildren()) do
    addcustommodel(v,"Amogus")
end
end)

local chinahattrail
local chinahatenabled = false
local ChinaHat = Extra:NewSection("ChinaHat")
ChinaHat:NewToggle("ChinaHat", "China Hat Boi", function(state)
       if state then
             chinahatenabled = state
        if chinahatenabled then
			spawn(function()
                repeat
                    task.wait(0.3)
                    if (not chinahatenabled) then return end
                    if entity.isAlive then
                        if chinahattrail == nil or chinahattrail.Parent == nil then
                            chinahattrail = Instance.new("Part")
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.Size = Vector3.new(3, 0.7, 3)
                            chinahattrail.Name = "ChinaHat"
                            chinahattrail.Material = Enum.Material.Neon
                            chinahattrail.CanCollide = false
                            chinahattrail.Transparency = 0.3
                            local chinahatmesh = Instance.new("SpecialMesh")
                            chinahatmesh.Parent = chinahattrail
                            chinahatmesh.MeshType = "FileMesh"
                            chinahatmesh.MeshId = "http://www.roblox.com/asset/?id=1778999"
                            chinahatmesh.Scale = Vector3.new(3, 0.6, 3)
                            local chinahatweld = Instance.new("WeldConstraint")
                            chinahatweld.Name = "WeldConstraint"
                            chinahatweld.Parent = chinahattrail
                            chinahatweld.Part0 = lplr.Character.Head
                            chinahatweld.Part1 = chinahattrail
                            chinahattrail.Parent = workspace.Camera
                        else
                            chinahattrail.Parent = workspace.Camera
                            chinahattrail.CFrame = lplr.Character.Head.CFrame * CFrame.new(0, 1.1, 0)
                            chinahattrail.LocalTransparencyModifier = ((cam.CFrame.Position - cam.Focus.Position).Magnitude <= 0.6 and 1 or 0)
                            if chinahattrail:FindFirstChild("WeldConstraint") then
                                chinahattrail.WeldConstraint.Part0 = lplr.Character.Head
                            end
                        end
                    else
                        if chinahattrail then 
                            chinahattrail:remove()
                            chinahattrail = nil
                        end
                    end
                until (not chinahatenabled)
            end)
        else
            if chinahattrail then
                chinahattrail:Remove()
                chinahattrail = nil
            end
        end
    end
end)

local Section = Render:NewSection("Capes")
Section:NewButton("HyperLine Cape", "ButtonInfo", function()
    local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(34,34,34)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "rbxassetid://10091910794"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Section:NewButton("Vape cape", "ButtonInfo", function()
    local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(0,0,0)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "http://www.roblox.com/asset/?id=9608953346"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Section:NewButton("Rektsky Cape", "ButtonInfo", function()
local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
  if lplr.Character:FindFirstChild("Torso") then
	torso = lplr.Character.Torso
  else
	torso = lplr.Character.UpperTorso
  end
  local CapeP = Instance.new("Part", torso.Parent)
  CapeP.Name = "Cape"
  CapeP.Anchored = false
  CapeP.CanCollide = false
  CapeP.TopSurface = 0
  CapeP.BottomSurface = 0
  CapeP.Color = Color3.fromRGB(255,255,255)
  CapeP.FormFactor = "Custom"
  CapeP.Size = Vector3.new(0.2,0.2,0.2)
  local decal = Instance.new("Decal", CapeP)
  decal.Texture = "http://www.roblox.com/asset/?id=9600268824"
  decal.Face = "Back"
  local msh = Instance.new("BlockMesh", CapeP)
  msh.Scale = Vector3.new(9,17.5,0.5)
  local motor = Instance.new("Motor", CapeP)
  motor.Part0 = CapeP
  motor.Part1 = torso
  motor.MaxVelocity = 0.01
  motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
  motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
  local wave = false
  repeat wait(1/44)
	decal.Transparency = torso.Transparency
	local ang = 0.1
	local oldmag = torso.Velocity.magnitude
	local mv = 0.002
	if wave then
	  ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
	  wave = false
	else
	  wave = true
	end
	ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
	motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
	motor.DesiredAngle = -ang
	if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
	  motor.MaxVelocity = 0.04
	end
	repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
	if torso.Velocity.magnitude < 0.1 then
	  wait(0.1)
	end
  until not CapeP or CapeP.Parent ~= torso.Parent
end
end)
Section:NewButton("Future Cape", "ButtonInfo", function()
    local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(34,34,34)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "http://www.roblox.com/asset/?id=9667893961"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Section:NewButton("JN HH Cape", "ButtonInfo", function()
     local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(34,34,34)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "http://www.roblox.com/asset/?id=9685546949"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Section:NewButton("TanqR Cape", "ButtonInfo", function()
      local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(34,34,34)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "http://www.roblox.com/asset/?id=9646618887"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Section:NewButton("Lithium Lite Cape", "ButtonInfo", function()
    local player = game:GetService("Players")
local lplr = player.LocalPlayer
if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
      if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
      else
        torso = lplr.Character.UpperTorso
      end
      local CapeP = Instance.new("Part", torso.Parent)
      CapeP.Name = "Cape"
      CapeP.Anchored = false
      CapeP.CanCollide = false
      CapeP.TopSurface = 0
      CapeP.BottomSurface = 0
      CapeP.Color = Color3.fromRGB(150,117,206)
      CapeP.FormFactor = "Custom"
      CapeP.Size = Vector3.new(0.2,0.2,0.2)
      local decal = Instance.new("Decal", CapeP)
      decal.Texture = "http://www.roblox.com/asset/?id=9685587041"
      decal.Face = "Back"
      local msh = Instance.new("BlockMesh", CapeP)
      msh.Scale = Vector3.new(9,17.5,0.5)
      local motor = Instance.new("Motor", CapeP)
      motor.Part0 = CapeP
      motor.Part1 = torso
      motor.MaxVelocity = 0.01
      motor.C0 = CFrame.new(0,1.75,0) * CFrame.Angles(0,math.rad(90),0)
      motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
      local wave = false
      repeat wait(1/44)
        decal.Transparency = torso.Transparency
        local ang = 0.1
        local oldmag = torso.Velocity.magnitude
        local mv = 0.002
        if wave then
          ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
          wave = false
        else
          wave = true
        end
        ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
        motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) + mv
        motor.DesiredAngle = -ang
        if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
          motor.MaxVelocity = 0.04
        end
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
