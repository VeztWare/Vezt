--i lost the source to this so i just decompiled it
local vu1 = game.Players.LocalPlayer.Character.Animate
local v2 = game.Players.LocalPlayer
game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
local v3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/KavoUi/main/KavoUi.lua"))().CreateLib("Vezt-Animations", "VeztPur")
local v4 = v3:NewTab("Info"):NewSection("Private")
local v5 = v3:NewTab("Animations"):NewSection("Animate Your Player")
v4:NewLabel("Hello " .. v2.Name .. "!")
v4:NewKeybind("ToggleUi", "?", Enum.KeyCode.F6, function()
    Library:ToggleUI()
end)
v5:NewToggle("Astronaut", "?", function(p6)
    if p6 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Bubbly", "?", function(p7)
    if p7 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
        vu1.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
        vu1.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Cartoony", "?", function(p8)
    if p8 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Elder", "?", function(p9)
    if p9 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Knight", "?", function(p10)
    if p10 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Levitation", "?", function(p11)
    if p11 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Mage", "?", function(p12)
    if p12 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Ninja", "?", function(p13)
    if p13 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Pirate", "?", function(p14)
    if p14 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Robot", "?", function(p15)
    if p15 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Stylish", "?", function(p16)
    if p16 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Toy", "?", function(p17)
    if p17 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Werewolf", "?", function(p18)
    if p18 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
v5:NewToggle("Zombie", "?", function(p19)
    if p19 then
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
    else
        vu1.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
        vu1.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
        vu1.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
        vu1.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
        vu1.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
        vu1.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
        vu1.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
    end
end)
