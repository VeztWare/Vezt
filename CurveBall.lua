-- so uh some guy said he'll pay me to make him this script but he just ghosted me after so i'll just open source it lol

local lplr = game.Players.LocalPlayer
--local SleitnickInput = require(lplr.PlayerScripts.Modules.SleitnickInput)
local camera = workspace.CurrentCamera
local SharedModules = game.ReplicatedStorage.SharedModules
--local Util = require(SharedModules.Util)
local Teams = game:GetService("Teams")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local BASE_THRESHOLD = 50
local SPEED_MULTIPLIER = 0.18
local MAX_THRESHOLD = 100
local MIN_THRESHOLD = 25
local visualSphere = nil
local AutoParryEnabled = false

local hrp = nil
local character = lplr.Character or lplr.CharacterAdded:Wait()

local function onCharacterAdded(char)
	character = char
	hrp = char:WaitForChild("HumanoidRootPart")
	
	if visualSphere then
		visualSphere:Destroy()
	end
	
	visualSphere = Instance.new("Part")
	visualSphere.Name = "ThresholdVisualizer"
	visualSphere.Shape = Enum.PartType.Ball
	visualSphere.Material = Enum.Material.ForceField
	visualSphere.Color = Color3.fromRGB(0, 150, 255)
	visualSphere.Transparency = 0.7
	visualSphere.CanCollide = false
	visualSphere.Anchored = true
	visualSphere.CastShadow = false
	visualSphere.Size = Vector3.new(BASE_THRESHOLD, BASE_THRESHOLD, BASE_THRESHOLD)
	visualSphere.Parent = workspace
end

lplr.CharacterAdded:Connect(onCharacterAdded)
if character then
	onCharacterAdded(character)
end

local cachedBall = nil
local function getBall()
	if cachedBall and cachedBall.Parent then
		return cachedBall
	end
	cachedBall = workspace:FindFirstChild("Ball")
	return cachedBall
end

local function isBallTarget(ball)
	return ball and ball:GetAttribute("Target") == lplr.Name
end

local function GetNearestPlayer(maxDistance)
	if not hrp then return nil end
	local nearest, dist = nil, maxDistance or math.huge
	for _, p in Players:GetPlayers() do
		if p ~= lplr and p.Character then
			local otherHrp = p.Character:FindFirstChild("HumanoidRootPart")
			if otherHrp then
				local d = (otherHrp.Position - hrp.Position).Magnitude
				if d < dist then
					dist = d
					nearest = p
				end
			end
		end
	end
	return nearest
end

local function getDynamicThreshold(ball)
	if not ball or not ball:IsA("BasePart") then
		return BASE_THRESHOLD
	end
	
	local velocity = ball.AssemblyLinearVelocity
	local speed = velocity.Magnitude
	local dynamicThreshold = BASE_THRESHOLD + (speed * SPEED_MULTIPLIER)
	
	return math.clamp(dynamicThreshold, MIN_THRESHOLD, MAX_THRESHOLD)
end

local function Parry()
	local parryArg1 = camera.CFrame
	local parryArg2 = GetNearestPlayer(math.huge)
	local parryArg3 = 0
	
	ReplicatedStorage.RemoteEvents.ParryRequest:FireServer(parryArg1, parryArg2, parryArg3)
end

RunService.RenderStepped:Connect(function()
	if not AutoParryEnabled then return end
	if not hrp then return end
	
	local ball = getBall()
	
	if ball then
		local isTargeted = isBallTarget(ball)
		local threshold = getDynamicThreshold(ball)
		local distance = (ball.Position - hrp.Position).Magnitude
		
		if visualSphere then
			visualSphere.Position = hrp.Position
			visualSphere.Size = Vector3.new(threshold, threshold, threshold)
			visualSphere.Color = isTargeted and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 150, 255)
		end
		
		if distance < threshold and isTargeted then
			Parry()
		end
	else
		cachedBall = nil
		
		if visualSphere and hrp then
			visualSphere.Position = hrp.Position
			visualSphere.Size = Vector3.new(BASE_THRESHOLD, BASE_THRESHOLD, BASE_THRESHOLD)
			visualSphere.Color = Color3.fromRGB(0, 150, 255)
		end
	end
end)

lplr.CharacterRemoving:Connect(function()
	if visualSphere then
		visualSphere:Destroy()
		visualSphere = nil
	end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ParryGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = false
screenGui.Parent = game.CoreGui

local button = Instance.new("TextButton")
button.Name = "ParryButton"
button.Size = UDim2.new(0, 150, 0, 75)
button.Position = UDim2.new(1, -160, 0, 10)
button.AnchorPoint = Vector2.new(0, 0)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.BorderSizePixel = 2
button.BorderColor3 = Color3.fromRGB(0, 150, 255)
button.Text = "Hold to spam parry"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 16
button.Font = Enum.Font.GothamBold
button.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = button

local isMobile = game:GetService("UserInputService").TouchEnabled and not  game:GetService("UserInputService").KeyboardEnabled

if not isMobile then
	button.Visible = false
end

local isActive = false

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		isActive = true
		button.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
	end
end)

button.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		isActive = false
		button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.E then
		isActive = true
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.E then
		isActive = false
	end
end)

RunService.RenderStepped:Connect(function()
	if isActive then
		Parry()
	end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Curve Ball AutoParry",
   Icon = 0,
   LoadingTitle = "CurveBall AutoParry",
   LoadingSubtitle = "by _vezt",
   ShowText = "Show/Hide Rayfield", 
   Theme = "Default", 

   ToggleUIKeybind = "K",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "CurveBall"
   },
})

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Main Configuration")

local Toggle = Tab:CreateToggle({
   Name = "AutoParry",
   CurrentValue = false,
   Flag = "AutoParry",
   Callback = function(Value)
	AutoParryEnabled = Value
   end,
})
