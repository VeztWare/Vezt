local lp = game:GetService("Players").LocalPlayer

function getremote(t)
    for i, v in pairs(t) do
        if v == "Client" then
            local tab = t[i + 1]
            return tab
        end
    end
    return ""
end

local KnitClient = debug.getupvalue(require(lp.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService"ReplicatedStorage".TS.remotes).default.Client
local Consume = getremote(debug.getconstants(debug.getproto(getmetatable(KnitClient.Controllers.ConsumeController).onEnable, 1)))

Bedwars = {
    SwordInfo = {
        [1] = { Name = "wood_sword", Display = "Wood Sword", Rank = 1 },
        [2] = { Name = "stone_sword", Display = "Stone Sword", Rank = 2 },
        [3] = { Name = "iron_sword", Display = "Iron Sword", Rank = 3 },
        [4] = { Name = "diamond_sword", Display = "Diamond Sword", Rank = 4 },
        [5] = { Name = "emerald_sword", Display = "Emerald Sword", Rank = 5 },
        [6] = { Name = "rageblade", Display = "Rage Blade", Rank = 6 },
    },
    ChestObserve = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"]["Inventory:SetObservedChest"],
    ChestGet = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"]["Inventory:ChestGetItem"],
    ChestGive = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"]["Inventory:ChestGiveItem"],
    GroundHit = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"].GroundHit,
    AbilityRemote = game:GetService("ReplicatedStorage"):FindFirstChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events").useAbility,
    PurchaseItem = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"].BedwarsPurchaseItem,
    AttackRemote = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))["instance"],
    PaintRemote = Client:Get(getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire))),
    Eat = Client:Get(Consume),
}

return Bedwars
