local plr = game:GetService("Players").LocalPlayer
local plrName = game:GetService("Players").LocalPlayer.Name
local eggsbegan = game:GetService("Players").LocalPlayer.leaderstats["Eggs Opened"].Value

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Egg Hatcher | Free Script",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "Egg Farming",
    IntroEnabled = true,
    IntroText = "Opening Interface",
    CloseCallback = function()
        print("Interface Closed")
    end
})
OrionLib:MakeNotification({
    Name = "Welcome Back",
    Content = "Thank You For Executing This Interface "..game.Players.LocalPlayer.Name.."!",
    Image = "rbxassetid://4483345998",
    Time = 5
})
local Tab = Window:MakeTab({
    Name = "Egg Farming",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "Farming Functions ETC"
})

Tab:AddLabel("Egg Farming")

Tab:AddToggle({
    Name = "Input Egg Name | Exact Name",
    Default = false,
    Callback = function(value)
        _G.AutoOpenEggs = value
    end
})

Tab:AddTextbox({
    Name = "Open Eggs | Single",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        while _G.AutoOpenEggs and value do
            local args = {
                [1] = "PurchaseEgg",
                [2] = value,
                [3] = Single
            }
            game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))
            wait()
            if not _G.AutoOpenEggs then
                break
            end
        end
    end
})

Tab:AddTextbox({
    Name = "Open Eggs | Triple",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        while _G.AutoOpenEggs and value do
            local args = {
                [1] = "PurchaseEgg",
                [2] = value,
                [3] = Multi
            }
            game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(unpack(args))
            wait()
            if not _G.AutoOpenEggs then
                break
            end
        end
    end
})
Tab:AddParagraph("Made By","This Was made By Primelus#5421 & sskint#1394")
