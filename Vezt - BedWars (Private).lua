local player = game.Players.LocalPlayer
---@Sounds
 local sound = Instance.new("Sound") sound.Parent = workspace sound.SoundId = "rbxassetid://2389339814" sound:Play()
local kavoUi = loadstring(game:HttpGet("https://pastebin.com/raw/dBNP91B2"))()
local window = kavoUi.CreateLib("Vezt(Private)","Vezt")
---Tabs
local Tab1 = window:NewTab("Info")
local Tab1Section = Tab1:NewSection("Vezt Project")
local Tab2 = window:NewTab("Combat")
local Tab2Section = Tab2:NewSection("Combat Settings")
local Tab3 = window:NewTab("Blatant")
local Tab3Section = Tab3:NewSection("Blatant Settings")
local Tab4 = window:NewTab("Render")
local Tab4Section = Tab4:NewSection("Render Settings")
local Tab5 = window:NewTab("World")
local Tab5Section = Tab5:NewSection("World Settings")
local Tab6 = window:NewTab("Auto Shop")
local Tab6Section = Tab6:NewSection("AutoBuy Armor")
---Info Section
Tab1Section:NewLabel("Hello " ..player.DisplayName.. " !"
Tab2Section:NewToggle("KillAura","?",function()
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "KillAura Enabled"; Duration = 1; })
local player = game:GetService("Players")
local lplr = player.LocalPlayer
local cam = workspace.CurrentCamera
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local SwordCont = KnitClient.Controllers.SwordController

local aura = false
local DistVal = {["Value"] = _G.Distance}
function Aura()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					aura = true
                    SwordCont:swingSwordAtMouse()
end
end
end
end
end

game:GetService("RunService").Stepped:connect(function()
Aura()
end)
end)
Tab2Section:NewSlider("Killaura Distance", "?", 500, 14, function(s)
    _G.Distance = s
end)
Tab2Section:NewLabel("Sword Things")
Tab2Section:NewToggle("NoClickDelay", "?", function(state)
  if state then
getgenv().funisus = v
        spawn(function()
            if getgenv().funisus and entity.isAlive then
                for i2,v2 in pairs(itemtable) do
                    if type(v2) == "table" and rawget(v2, "sword") then
                        v2.sword.attackSpeed = 0.000000001
                    end
                    SwordCont.isClickingTooFast = function() return false end
                end
            else
            end
        end)
    end
  end)
Tab2Section:NewLabel("Avoid Players")
Tab2Section:NewToggle("AutoJump","?",function(state)
  if state then
    _G.AutoJump = true
    while _G.AutoJump == true do
      wait(0.8)
      game.Players.LocalPlayer.Character.Humanoid.Jump = true
      end
    else
   _G.AutoJump = false
      while _G.AutoJump == true do
        wait()
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
      end
  end
end)
--1299476322
Tab5Section:NewButton("AntiVoid", "?", function()
local specialpos = (workspace.MapCFrames:FindFirstChild("center") and workspace.MapCFrames.center.Value.p == Vector3.new(77, 11, 35))
        AntiVoidP = Instance.new("Part")
        AntiVoidP.Parent = Workspace
        AntiVoidP.Name = "AntiVoid"
        AntiVoidP.CanCollide = true
        AntiVoidP.Size = Vector3.new(2048, 0.30, 2048)
        AntiVoidP.Anchored = true
        AntiVoidP.Transparency = 0.4
        AntiVoidP.Color = Color3.fromRGB(35, 25, 50)
        AntiVoidP.Position = Vector3.new(0, 30.5, 0)
end)
Tab4Section:NewToggle("Fov","?",function(state)
if state then
_G.Fov = true
while _G.Fov == true do
wait()
game.Workspace.CurrentCamera.FieldOfView = 120
end
else
_G.Fov = false
while _G.Fov == true do
wait()
game.Workspace.CurrentCamera.FieldOfView = 90
end
end
end)
Tab6Section:NewToggle("Auto Leather Armor","?",function(state)
if state then
_G.AutoLeatherArmor = true
while _G.AutoLeatherArmor == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "leather_chestplate",
            ["price"] = 50,
            ["customDisplayName"] = "Leather Armor",
            ["currency"] = "iron",
            ["category"] = "Combat",
            ["amount"] = 1,
            ["ignoredByKit"] = {
                [1] = "bigman"
            },
            ["spawnWithItems"] = {
                [1] = "leather_helmet",
                [2] = "leather_chestplate",
                [3] = "leather_boots"
            },
            ["nextTier"] = "iron_chestplate"
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
else
_G.AutoLeatherArmor = false
while _G.AutoLeatherArmor == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "leather_chestplate",
            ["price"] = 50,
            ["customDisplayName"] = "Leather Armor",
            ["currency"] = "iron",
            ["category"] = "Combat",
            ["amount"] = 1,
            ["ignoredByKit"] = {
                [1] = "bigman"
            },
            ["spawnWithItems"] = {
                [1] = "leather_helmet",
                [2] = "leather_chestplate",
                [3] = "leather_boots"
            },
            ["nextTier"] = "iron_chestplate"
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
end
end)
Tab6Section:NewToggle("Auto Iron Armor","?",function(state)
if state then
_G.AutoLeatherArmor = true
while _G.AutoLeatherArmor == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "iron_chestplate",
            ["price"] = 120,
            ["prevTier"] = "leather_chestplate",
            ["customDisplayName"] = "Iron Armor",
            ["currency"] = "iron",
            ["amount"] = 1,
            ["category"] = "Combat",
            ["tiered"] = true,
            ["ignoredByKit"] = {
                [1] = "bigman"
            },
            ["spawnWithItems"] = {
                [1] = "iron_helmet",
                [2] = "iron_chestplate",
                [3] = "iron_boots"
            },
            ["nextTier"] = "diamond_chestplate"
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
else
_G.AutoIronArmor = false
while _G.AutoIronArmor == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "iron_chestplate",
            ["price"] = 120,
            ["prevTier"] = "leather_chestplate",
            ["customDisplayName"] = "Iron Armor",
            ["currency"] = "iron",
            ["amount"] = 1,
            ["category"] = "Combat",
            ["tiered"] = true,
            ["ignoredByKit"] = {
                [1] = "bigman"
            },
            ["spawnWithItems"] = {
                [1] = "iron_helmet",
                [2] = "iron_chestplate",
                [3] = "iron_boots"
            },
            ["nextTier"] = "diamond_chestplate"
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
end
end)
Tab6Section:NewLabel("Auto Axe")
Tab6Section:NewToggle("Auto Iron Axe","?",function(state)
if state then
_G.AutoIronAxe = true
while _G.AutoIronAxe == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "iron_axe",
            ["price"] = 30,
            ["prevTier"] = "stone_axe",
            ["nextTier"] = "diamond_axe",
            ["currency"] = "iron",
            ["disabledInQueue"] = {
                [1] = "tnt_wars"
            },
            ["category"] = "Tools",
            ["tiered"] = true,
            ["ignoredByKit"] = {
                [1] = "miner"
            },
            ["spawnWithItems"] = {
                [1] = "iron_axe"
            },
            ["amount"] = 1
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
else
_G.AutoIronAxe = false
while _G.AutoIronAxe == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["itemType"] = "iron_axe",
            ["price"] = 30,
            ["prevTier"] = "stone_axe",
            ["nextTier"] = "diamond_axe",
            ["currency"] = "iron",
            ["disabledInQueue"] = {
                [1] = "tnt_wars"
            },
            ["category"] = "Tools",
            ["tiered"] = true,
            ["ignoredByKit"] = {
                [1] = "miner"
            },
            ["spawnWithItems"] = {
                [1] = "iron_axe"
            },
            ["amount"] = 1
        }
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("BedwarsPurchaseItem"):InvokeServer(unpack(args))
end
end
end)
Tab6Section:NewLabel("Auto Swords")
Tab6Section:NewToggle("Auto IronSword","?",function(state)
if state then
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "AutoSword[iron] Enabled"; Duration = 1; })
_G.AutoIronSword = true
while _G.AutoIronSword == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["disabledInQueue"] = {
                [1] = "tnt_wars"
            },
            ["itemType"] = "iron_sword",
            ["amount"] = 1,
            ["price"] = 70,
            ["ignoredByKit"] = {
                [1] = "barbarian",
                [2] = "dasher",
                [3] = "frost_hammer_kit"
            },
            ["category"] = "Combat",
            ["currency"] = "iron"
        }
    }
}
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.BedwarsPurchaseItem:InvokeServer(unpack(args))
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "AutoSword[iron] Disabled"; Duration = 1; })
_G.AutoIronSword = false
while _G.AutoIronSword == true do
wait()
local args = {
    [1] = {
        ["shopItem"] = {
            ["lockAfterPurchase"] = true,
            ["disabledInQueue"] = {
                [1] = "tnt_wars"
            },
            ["itemType"] = "iron_sword",
            ["amount"] = 1,
            ["price"] = 70,
            ["ignoredByKit"] = {
                [1] = "barbarian",
                [2] = "dasher",
                [3] = "frost_hammer_kit"
            },
            ["category"] = "Combat",
            ["currency"] = "iron"
        }
    }
}
game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged.BedwarsPurchaseItem:InvokeServer(unpack(args))
end
end
end)
Tab3Section:NewButton("Cape","?",function()
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "Cape XD"; Duration = 1; })
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
        repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) +
1
        if torso.Velocity.magnitude < 0.1 then
          wait(0.1)
        end
      until not CapeP or CapeP.Parent ~= torso.Parent
    end
end)
Tab3Section:NewToggle("Fly","AntiCheated",function(state)
  if state then
game.Workspace.Gravity = 0
else
game.Workspace.Gravity = 168.2
end
end)
Tab4Section:NewButton("Tracers", "?", function()
loadstring(game:HttpGet("https://pastebin.com/raw/57uQDwt7"))()
end)
Tab3Section:NewToggle("Speed", "?", function(state)
if state then
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
else
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
end
end)
Tab3Section:NewToggle("ChatSpammer", "?", function(state) 
if state then
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "ChatSpammer Enabled"; Duration = 1; })
_G.Spam = true
while _G.Spam == true do
wait(1)
local args = {
    [1] = "Vezt On Top",
    [2] = "All"
}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end
else
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "Chat Spammer Disabled"; Duration = 1; })
_G.Spam = false
while _G.Spam == true do
wait(1)
local args = {
    [1] = "Vezt On Top",
    [2] = "All"
}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end
end
end)
Tab3Section:NewButton("inf jump","?",function()
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Vezt"; Text = "You Cant Disable Inf Jump"; Duration = 1; })
loadstring(game:HttpGet("https://pastebin.com/raw/bC97eAyR", true))()
end)
