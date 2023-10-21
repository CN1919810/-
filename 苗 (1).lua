local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Credits"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")


local playerGui = game.Players.LocalPlayer.PlayerGui

local health = 100


local healthGui = Instance.new("ScreenGui")
healthGui.Name = "HealthGui"
healthGui.Parent = playerGui

local healthFrame = Instance.new("Frame")
healthFrame.Name = "HealthFrame"
healthFrame.Size = UDim2.new(0, 150, 0, 20)
healthFrame.Position = UDim2.new(1, -170, 0, 20)
healthFrame.BackgroundColor3 = Color3.fromRGB(59, 255, 255)
healthFrame.BorderSizePixel = 0
healthFrame.Parent = healthGui

local healthBar = Instance.new("Frame")
healthBar.Name = "HealthBar"
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
healthBar.BorderSizePixel = 0
healthBar.Parent = healthFrame

local function updateHealthGUI()

   healthBar.Size = UDim2.new(health / 100, 0, 1, 0)
end

updateHealthGUI()

game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(newHealth)
   health = newHealth
   updateHealthGUI()
end)

local playerGui = game.Players.LocalPlayer.PlayerGui

local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FpsGui"
fpsGui.Parent = playerGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FpsLabel"
fpsLabel.Size = UDim2.new(0, 100, 0, 20)
fpsLabel.Position = UDim2.new(0, 20, 0, 20)
fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.Font = Enum.Font.SourceSans
fpsLabel.FontSize = Enum.FontSize.Size14
fpsLabel.Text = "FPS: "
fpsLabel.Parent = fpsGui

local lastUpdate = tick()

local fps = 0

local function updateFpsCounter()
    local deltaTime = tick() - lastUpdate
    lastUpdate = tick()
    
    fps = math.floor(1 / deltaTime)
    
    fpsLabel.Text = "帧数: " .. fps
end

game:GetService("RunService").RenderStepped:Connect(updateFpsCounter)


local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "Image"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
ImageLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
ImageLabel.Image = "rbxassetid://7734068321"
ImageLabel.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Text"
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.new(240, 192, 203)
TextLabel.TextScaled = true
TextLabel.Text = "苗脚本"
TextLabel.Parent = ScreenGui

local function animateCredits()
    local TweenService = game:GetService("TweenService")
    local imageTween = TweenService:Create(ImageLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.2, 0)})
    local textTween = TweenService:Create(TextLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.1, 0)})
    imageTween:Play()
    textTween:Play()
    
    wait(10)
    
    ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
    TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
    
    ScreenGui:Destroy()
end

animateCredits()

local creditText = "作者废物淼"
local creditDuration = 5

-- 定义可供选择的贴花id（免疫自己忘了说干嘛的）
local decalIds = {
    5479567228,
    5479565074,
    5479559610,
}

-- 从列表中选择一个随机贴花ID
local decalId = decalIds[math.random(#decalIds)]

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationCreditsGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -200, 1, -50)
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.Parent = ScreenGui

local Decal = Instance.new("Decal")
Decal.Texture = "rbxassetid://" .. decalId
Decal.Face = Enum.NormalId.Back
Decal.Parent = Frame

local TextLabel = Instance.new("TextLabel")
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = creditText
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
TextLabel.TextSize = 16
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.Size = UDim2.new(1, -20, 1, -20)
TextLabel.Parent = Frame

local function animateNotification()
    Frame:TweenPosition(UDim2.new(1, -200, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(creditDuration - 1)
    Frame:TweenPosition(UDim2.new(1, 0, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(0.5)
    ScreenGui:Destroy()
end

animateNotification()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
Notification.Notify("️废物的脚本", "脚本正在加载（反挂机已开启）", "rbxassetid://7734068321", {
    Duration = 5,       
    Main = {
        Rounding = true,
    }
});
print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/HBUI/main/HBUI.txt"))()

Notification.Notify("苗脚本", "  废物脚本加载成功  ", "rbxassetid://7734068321", {
    Duration = 3,       
    Main = {
        Rounding = true,
    }
});
local Window = OrionLib:MakeWindow({Name = "废物苗脚本", HidePremium = false, IntroEnabled = false, ConfigFolder = false})
local Tab = Window:MakeTab({
	Name = "公告",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("此脚本为免费")
Tab:AddParagraph("作者：淼")
Tab:AddButton({
  Name = "反挂机",
  Callback = function()
    print("Anti Afk On")
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      wait(1)
      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
  end
})

local Tab = Window:MakeTab({
	Name = "通用的🤓",
	Icon = "rbxassetid://3610239960",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "废物",
	Callback = function()

})

Tab:AddTextbox({
	Name = "跳跃高度设置👍🏻",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "移动速度设置👍🏻",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "重力👌🏻设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddTextbox({
	Name = "HP设置（几乎没有用）",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
	Name = "飞行",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/gHNFtdZN"))()
  	end    
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "夕",
    Text = "执行成功",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "4k画质",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/nUrpHG3N"))();
end
})

Tab:AddButton({
	Name = "骂人无违规",
	Callback = function()
     loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()
	end
})

Tab:AddButton({
	Name = "死亡笔记",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/siwangbook/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0(1).txt"))()
	end
})

Tab:AddButton({
	Name = "旋转大牛",
	Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

Tab:AddButton({
	Name = "透视",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
  	end    
})

Tab:AddButton({
	Name = "吸取全部玩家",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/hQSBGsw2'))()
  	end    
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "隐身(E)",
	Callback = function()
	 loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
  	end    
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
	Name = "一键获取无限R币",
	Callback = function()
     game.Players.LocalPlayer:Kick('开你妈的挂')
    end    
})

Tab:AddButton({
	Name = "飞车",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "夕脚本",
    Text = "成功执行",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
  	end    
})

local Tab = Window:MakeTab({
    Name = "披萨店脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
 
Tab:AddButton({
	Name = "披萨店食物乱飞",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/TQwh73Dx"))();
    end    
})

local Tab = Window:MakeTab({
    Name = "彩虹朋友",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
 
Tab:AddButton({
    Name="彩虹朋友",
    Callback=function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/Sempiller/RainbowTool/main/Turkish.lua'))();
    end
})

local Hb = Window:MakeTab({
	Name = "脚本大全",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Hb:AddButton({
	Name = "lnfectious",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/InfectiousSmile.lua", true))()
  	end    
})

Hb:AddButton({
	Name = "伐木大亨2多功能",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))()
  	end
})

Hb:AddButton({
	Name = "管理员脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Hb:AddButton({
	Name = "彩虹朋友",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
  	end    
})

Hb:AddButton({
	Name = "HoHo",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
  	end    
})

Hb:AddButton({
	Name = "tds查看兵",
	Callback = function()
     local Towers = game:GetService("Players").LocalPlayer.PlayerGui.Interface.Root.Inventory.View.Frame.Frame.Frame
 
for _, v in pairs(Towers:GetDescendants()) do
	if v:IsA("ImageButton") then
        v.Visible = true
	end
end
  	end    
})

Hb:AddButton({
	Name = "阿尔宙斯V3.0 UI",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
  	end    
})

Hb:AddButton({
	Name = "bark2.0",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/bark2.0.lua"))()
  	end    
})

Hb:AddButton({
	Name = "动画星期五",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
  	end    
})

Hb:AddButton({
	Name = "宠物模拟器X",
	Callback = function()
     loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
  	end    
})

Hb:AddButton({
	Name = "蜂群模拟器",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/3A61hnGA", true))()
  	end    
})

Hb:AddButton({
	Name = "Evade",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
  	end    
})

Hb:AddButton({
	Name = "兵工厂",
	Callback = function()
     loadstring(game:HttpGet(('https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init'), true))()
  	end    
})

Hb:AddButton({
	Name = "后室",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/Gsqd40fL'))()
  	end    
})

Hb:AddButton({
	Name = "伐木大亨2",
	Callback = function()
     loadstring(game:HttpGet('https://getexploits.com/key-system/',true))('https://da.com/936657404291084298/1006220505583460352/Script.txt')
  	end    
})

Hb:AddButton({
	Name = "巴掌模拟器",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
  	end    
})

Hb:AddButton({
	Name = "Synapse X",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "造船寻宝",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "自动刷金条",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr",true))()
  	end
})

Tab:AddButton({
	Name = "工具包",
	Callback = function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()	
  	end
})

Tab:AddButton({
	Name = "防止掉线（反挂机）",
	Callback = function()
	print("Anti Afk On")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
  	end
})

local Tab = Window:MakeTab({
    Name = "力量传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
 
Tab:AddButton({
	Name = "力量传奇脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
end
})
Tab:AddButton({
	Name = "传送到出生点",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
  	end    
})
 
Tab:AddButton({
	Name = "传送到冰霜健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
  	end    
})
 
Tab:AddButton({
	Name = "传送到神话健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
  	end    
})
Tab:AddButton({
	Name = "传送到永恒健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
  	end    
})
Tab:AddButton({
	Name = "传送到传说健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
  	end    
})
Tab:AddButton({
	Name = "传送到肌肉之王健身房",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
  	end    
})
Tab:AddButton({
	Name = "传送到安全岛",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
  	end    
})
Tab:AddButton({
	Name = "传送到幸运抽奖区域",
	Callback = function()
      		      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
  	end    
})

local Tab = Window:MakeTab({
	Name = "垃圾脚本",
	Icon = "rbxassetid://13519683179",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "极速",
	Callback = function()
loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
end
})

Tab:AddButton({
    Name = "力量",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat', true))()
end
})

Tab:AddButton({
    Name = "忍者",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/why-png/scriptstuffz/master/ninjaleg2", true))()
end
})

Tab:AddButton({
	Name = "俄亥俄州",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
end
})

local Tab = Window:MakeTab({
	Name = "极速传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "开启卡宠",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/uR6azdQQ"))()
	end
})

Tab:AddButton({
	Name = "自动重生和自动刷等级",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/T9wTL150"))()        
  	end    
})

local Section = Tab:AddSection({
	Name = "传送岛屿"
})

Tab:AddButton({
	Name = "返还出生岛",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9682.98828125, 58.87917709350586, 3099.033935546875)      
  	end    
})

Tab:AddButton({
	Name = "白雪城",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9676.138671875, 58.87917709350586, 3782.69384765625)   
  	end    
})

Tab:AddButton({
	Name = "熔岩城",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11054.96875, 216.83917236328125, 4898.62841796875)       
  	end    
})

Tab:AddButton({
	Name = "传奇公路",
	Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13098.87109375, 216.83917236328125, 5907.6279296875)    
  	end    
})

local Tab = Window:MakeTab({
	Name = "监狱人生",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "变车模型",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
  	end
})

Tab:AddButton({
	Name = "变死神",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/ewv9bbRp"))()    
  	end
})

Tab:AddButton({
	Name = "变钢铁侠",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
  	end
})

Tab:AddButton({
	Name = "成为管理大牛",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/lifeguan/main/%E7%9B%91%E7%8B%B1%E4%BA%BA%E7%94%9F%E7%AE%A1%E7%90%86%E5%91%98.txt"))()
	end
})

Tab:AddButton({
	Name = "手里剑（秒杀）",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
  	end
})

Tab:AddToggle({
	Name = "杀戮光环",
	Default = false,
	Callback = function(Value)
    Aura = Value
    game.RunService.Stepped:Connect(function()
        for i, e in pairs(game.Players:GetChildren()) do
            if Aura and e ~= game.Players.LocalPlayer then
                game.ReplicatedStorage.meleeEvent:FireServer(e)
            end
        end
    end)
end
})

Tab:AddButton({
	Name = "杀死全部",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()
  	end
})

Tab:AddButton({
	Name = "逮捕",
	Callback = function()
Player = game.Players.LocalPlayer
	Pcf = Player.Character.HumanoidRootPart.CFrame
	for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
	if v.Name ~= Player.Name then
	local i = 10
    repeat
    wait()
    i = i-1
    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
    until i == 0
end
end
end
})

Tab:AddButton({
	Name = "无敌模式",
	Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
  	end
})

Tab:AddButton({
	Name = "PRISONWARE V1.3",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

Tab:AddButton({
	Name = "警卫室",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
  	end
})

Tab:AddButton({
	Name = "监狱室内",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
  	end
})

Tab:AddButton({
	Name = "罪犯复活点",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
  	end
})

Tab:AddButton({
	Name = "监狱室外",
	Callback = function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
  	end
})

local Tab = Window:MakeTab({
	Name = "忍者传奇",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})
autoswing = false
function swinging()
    spawn(
        function()
            while autoswing == true do
                task.wait()
                game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
                if not autoswing then
                    break
                end
            end
        end
    )
end
autosell = false
function selling()
    spawn(
        function()
            while autosell == true do
                task.wait(.01)
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                    wait(.1)
                    game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                        game.Workspace.Part.CFrame
                    if not autosell then
                        break
                    end
                end
            end
        end
    )
end
autosellmax = false
function maxsell()
    spawn(
        function()
            while autosellmax == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                        task.wait()
                        game.workspace.sellAreaCircles["sellAreaCircle7"].circleInner.CFrame =
                            game.Workspace.Part.CFrame
                    end
                end
                if not autosellmax then
                    break
                end
            end
        end
    )
end
autobuyswords = false
function buyswords()
    spawn(
        function()
            while autobuyswords == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllSwords"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyswords then
                    break
                end
            end
        end
    )
end
autobuybelts = false
function buybelts()
    spawn(
        function()
            while autobuybelts == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllBelts"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuybelts then
                    break
                end
            end
        end
    )
end
autobuyranks = false
function buyranks()
    spawn(
        function()
            while autobuyranks == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyRank"
                    local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
                    end
                end
                if not autobuyranks then
                    break
                end
            end
        end
    )
end
autobuyskill = false
function buyskill()
    spawn(
        function()
            while autobuyskill == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllSkills"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyskill then
                    break
                end
            end
        end
    )
end
autobuyshurikens = false
function buyshurikens()
    spawn(
        function()
            while autobuyshurikens == true do
                task.wait()
                if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
                    local oh1 = "buyAllShurikens"
                    local oh2 = {
                        "Ground",
                        "Astral Island",
                        "Space Island",
                        "Tundra Island",
                        "Eternal Island",
                        "Sandstorm",
                        "Thunderstorm",
                        "Ancient Inferno Island",
                        "Midnight Shadow Island",
                        "Mythical Souls Island",
                        "Winter Wonder Island"
                    }
                    for i = 1, #oh2 do
                        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
                    end
                end
                if not autobuyshurikens then
                    break
                end
            end
        end
    )
end

Tab:AddToggle(
    {
        Name = "自动挥舞",
        Default = false,
        Callback = function(x)
            autoswing = x
            if autoswing then
                swinging()
            end
        end
    }
)
Tab:AddToggle(
    {
        Name = "自动售卖",
        Default = false,
        Callback = function(x)
            autosell = x
            if autosell then
                selling()
            end
        end
    }
)
local Section = Tab:AddSection({
	Name = "自动购买功能"
})

Tab:AddToggle(
    {
        Name = "自动购买剑",
        Default = false,
        Callback = function(x)
            autobuyswords = x
            if autobuyswords then
                buyswords()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买腰带",
        Default = false,
        Callback = function(x)
            autobuybelts = x
            if autobuybelts then
                buybelts()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买称号（等级）",
        Default = false,
        Callback = function(x)
            autobuyranks = x
            if autobuyranks then
                buyranks()
            end
        end
    }
)

Tab:AddToggle(
    {
        Name = "自动购买忍术",
        Default = false,
        Callback = function(x)
            autobuyskill = x
            if autobuyskill then
                buyskill()
            end
        end
    }
)

Tab:AddButton(
    {
        Name = "解锁所有岛",
        Callback = function()
            for _, v in next, game.workspace.islandUnlockParts:GetChildren() do
                if v then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame
                    wait(.5)
                end
            end
        end
    }
)
local Tab = Window:MakeTab({
	Name = "鲨口求生2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddDropdown({
	Name = "免费船只",
	Default = "1",
	Options = {"DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine",  "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)

game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end    
})

Tab:AddButton({
	Name = "自动杀鲨鱼🦈",
	Callback = function()
     local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "夕脚本",
    Text = "（自动已开启）",
    Duration = 3, 
})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "FE脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "C00lgui",
	Callback = function()
     loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
  	end    
})

Tab:AddButton({
	Name = "1x1x1x1",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
  	end    
})

Tab:AddButton({
	Name = "变玩家（R6）",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
  	end    
})

Tab:AddButton({
	Name = "动画中心",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "制作B.A工作室",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "doors",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/whXp1Ca2"))()
  	end    
})

Tab:AddButton({
	Name = "Break in(故事)",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/28Z4ExEn", true))()
  	end
})

Tab:AddButton({
	Name = "Evade",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E4%BA%91%E8%84%9A%E6%9C%ACEvade.lua"))()
  	end
})

Tab:AddButton({
	Name = "超级doors（会覆盖）",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "doors",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "doors"
})

Tab:AddButton({
	Name = "doors大全",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/PRcsaytH"))()
  	end    
})

Tab:AddButton({
  Name = "门绘图显示",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/doors1"))()
    end
})

Tab:AddButton({
	Name = "手电筒（没电会有bug）",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Normal%20Flashlight"))()
end
})      

Tab:AddButton({
  Name = "DOORS低回拉穿墙",
  Callback = function()
    loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()
    end
})

Tab:AddButton({
  Name = "刷怪菜单",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
    end
})

Tab:AddButton({
    Name = "qbdoors",
    Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/4Nteprcy"))()
    end
})

Tab:AddButton({
	Name = "DOORS变身脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
    end
}) 

Tab:AddButton({
	Name = "不可能模式",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt'))()
  	end
})

Tab:AddButton({
	Name = "Endless模式",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/worldcuuuup/main/Script.lua"))()
  	end
})

Tab:AddButton({
    Name = "产卵尖叫",
    Callback = function ()
        require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
    workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
    
    end
})


Tab:AddButton({
    Name = "卵 Ambush",
    Callback = function ()
        local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
        local Configuration = {
            Kill = false, 
            Speed = 160,
            Time = 3 
        }
        
        EntitySpawner:Spawn("Ambush", Configuration)
    end
})

Tab:AddButton({
    Name = "产卵伏击[可杀死]",
    Callback = function ()
        local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/Spawner_V2.lua"))()
        local Configuration = {
            Kill = true,
            Speed = 160, 
            Time = 3
        }
        
        EntitySpawner:Spawn("Ambush", Configuration)
    end
})

Tab:AddButton({
    Name = "卵 Seek",
    Callback = function ()
        local EntitySpawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/dreadmania/Scripts/main/EntitySpawner.lua"))()
        local Configuration = {}
        
        EntitySpawner:Spawn("Seek", unpack(Configuration))    
    end
})

Tab:AddButton({
    Name = "卵 Eyes",
    Callback = function ()
        local enableDamage = false
        repenttimes = 0
        local deadeyescrucifix = false
        local repentcomplete = false
        local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
        local eyes = game:GetObjects("rbxassetid://11488518082")[1]
        local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
        eyes.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)
        
        eyes.Parent = workspace
        eyes.Initiate:Play()
        task.wait(0.5)
        eyes.Attachment.Eyes.Enabled = true
        eyes.whisper:Play()
        eyes.whisper.Looped = true
        function EyesHell()
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(10,30,0.7,0.1)
        ts = game:GetService("TweenService")
        wait(0.2)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(2,30,5,2)
        wait(3)
        
        eyes.Scream:Play()
        ts:Create(eyes,TweenInfo.new(5),{CFrame = eyes.CFrame - Vector3.new(0,12,0)}):Play()
        wait(7)
        eyes:Destroy()
        end
        local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        
        local function IsVisible(part)
            local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            local onscreen = found and vec.Z > 0
            local cfg = RaycastParams.new();
            cfg.FilterType = Enum.RaycastFilterType.Blacklist
            cfg.FilterDescendantsInstances = {part};
        
            local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
            return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
        end
        
        while true do
            if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= currentLoadedRoom then
                enableDamage = false
                task.wait(0.2)
                eyes:Destroy()
            end
            if enableDamage then
                if (IsVisible(eyes)) and not game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and deadeyescrucifix == false then
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 10
                wait(0.2)
                elseif (IsVisible(eyes)) and game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes < 5 and deadeyescrucifix == false then
                print("GET THAT AWAY FROM ME")
                eyes.Repent:Play()
                eyes.Attachment.Angry.Enabled = true
                local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        
        camShake:ShakeOnce(5,50,0.7,0.2)
                wait(0.7)
                repenttimes = repenttimes + 1
                print(repenttimes)
                eyes.Attachment.Angry.Enabled = false
                wait(0.4)
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes == 5 and deadeyescrucifix == false then
                local hi = game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle:Clone()
                hi.Anchored = true
                hi.Parent = workspace
                hi:PivotTo(game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle.CFrame)
                game.Players.LocalPlayer.Character:FindFirstChild("Crucifix"):Destroy()
                EyesHell()
                enableDamage = false
                    if hum.Health <= 0 then
                        game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
                            "Eyes"
                        debug.setupvalue(
                            getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function,
                            1,
                            {
                                "You died to the Eyes...",
                                "They don't like to be stared at.",
                            }
                        )
                    end
                end
            end
            task.wait(0.2)
        end
        
                       
    end
})


Tab:AddButton({
    Name = "产卵眼[可杀死]",
    Callback = function ()
        local enableDamage = true
        repenttimes = 0
        local deadeyescrucifix = false
        local repentcomplete = false
        local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
        local eyes = game:GetObjects("rbxassetid://11488518082")[1]
        local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
        eyes.CFrame = (num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]).CFrame + Vector3.new(0, 7, 0)
        
        eyes.Parent = workspace
        eyes.Initiate:Play()
        task.wait(0.5)
        eyes.Attachment.Eyes.Enabled = true
        eyes.whisper:Play()
        eyes.whisper.Looped = true
        function EyesHell()
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(10,30,0.7,0.1)
        ts = game:GetService("TweenService")
        wait(0.2)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        camShake:ShakeOnce(2,30,5,2)
        wait(3)
        
        eyes.Scream:Play()
        ts:Create(eyes,TweenInfo.new(5),{CFrame = eyes.CFrame - Vector3.new(0,12,0)}):Play()
        wait(7)
        eyes:Destroy()
        end
        local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        
        local function IsVisible(part)
            local vec, found=workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            local onscreen = found and vec.Z > 0
            local cfg = RaycastParams.new();
            cfg.FilterType = Enum.RaycastFilterType.Blacklist
            cfg.FilterDescendantsInstances = {part};
        
            local cast = workspace:Raycast(part.Position, (game.Players.LocalPlayer.Character.UpperTorso.Position - part.Position), cfg);
            return (onscreen and true) and ((cast and cast.Instance).Parent==game.Players.LocalPlayer.Character and true)
        end
        
        while true do
            if workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value] ~= currentLoadedRoom then
                enableDamage = false
                task.wait(0.2)
                eyes:Destroy()
            end
            if enableDamage then
                if (IsVisible(eyes)) and not game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and deadeyescrucifix == false then
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.Health - 10
                wait(0.2)
                elseif (IsVisible(eyes)) and game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes < 5 and deadeyescrucifix == false then
                print("GET THAT AWAY FROM ME")
                eyes.Repent:Play()
                eyes.Attachment.Angry.Enabled = true
                local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
        local camara = game.Workspace.CurrentCamera
        local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
        end)
        camShake:Start()
        
        camShake:ShakeOnce(5,50,0.7,0.2)
                wait(0.7)
                repenttimes = repenttimes + 1
                print(repenttimes)
                eyes.Attachment.Angry.Enabled = false
                wait(0.4)
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Crucifix") and repenttimes == 5 and deadeyescrucifix == false then
                local hi = game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle:Clone()
                hi.Anchored = true
                hi.Parent = workspace
                hi:PivotTo(game.Players.LocalPlayer.Character:FindFirstChild("Crucifix").Handle.CFrame)
                game.Players.LocalPlayer.Character:FindFirstChild("Crucifix"):Destroy()
                EyesHell()
                enableDamage = false
                    if hum.Health <= 0 then
                        game:GetService("ReplicatedStorage").GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value =
                            "Eyes"
                        debug.setupvalue(
                            getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function,
                            1,
                            {
                                "You died to the Eyes...",
                                "They don't like to be stared at.",
                            }
                        )
                    end
                end
            end
            task.wait(0.2)
        end
        
                       
    end
})



Tab:AddButton({
    Name = "产卵停止",
    Callback = function ()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
        require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
    
    end
})

Tab:AddButton({
    Name = "产生毛刺",
    Callback = function ()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
        require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(Data, workspace.CurrentRooms[tostring(game.ReplicatedStorage.GameData.LatestRoom.Value)])
    
    end
})

Tab:AddButton({
    Name = "产卵高峰",
    Callback = function ()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            CustomName = "Rush", -- Custom name of your entity
            Model = "https://github.com/Johnny39871/assets/blob/main/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 100, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = false,
            KillRange = 25,
            BreakLights = true,
            BackwardsMovement = false,
            FlickerLights = {
                true, -- Enabled/Disabled
                1, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(0, 0, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 4,
                        Max = 4,
                    },
                },
            },
            CustomDialog = {"You died to Rush...", "your balls look dry", "Can I put some lotion on them?"}, -- Custom death message
        })
        
        -----[[ Advanced ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
            print("Entity has spawned:", entityTable.Model)
        end
        
        entity.Debug.OnEntityDespawned = function(entityTable)
            print("Entity has despawned:", entityTable.Model)
        end
        
        entity.Debug.OnEntityStartMoving = function(entityTable)
            print("Entity has started moving:", entityTable.Model)
        end
        
        entity.Debug.OnEntityFinishedRebound = function(entityTable)
            print("Entity has finished rebound:", entityTable.Model)
        end
        
        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
            print("Entity:", entityTable.Model, "has entered room:", room)
        end
        
        entity.Debug.OnLookAtEntity = function(entityTable)
            print("Player has looked at entity:", entityTable.Model)
        end
        
        entity.Debug.OnDeath = function(entityTable)
            warn("Player has died.")
        end
        ------------------------
        
        -- Run the created entity
        Creator.runEntity(entity)
        
    end
})



Tab:AddButton({
    Name = "产卵拉什[可杀死]",
    Callback = function ()
        local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

        -- Create entity
        local entity = Creator.createEntity({
            CustomName = "Rush", -- Custom name of your entity
            Model = "https://github.com/Johnny39871/assets/blob/main/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
            Speed = 100, -- Percentage, 100 = default Rush speed
            DelayTime = 2, -- Time before starting cycles (seconds)
            HeightOffset = 0,
            CanKill = true,
            KillRange = 25,
            BreakLights = true,
            BackwardsMovement = false,
            FlickerLights = {
                true, -- Enabled/Disabled
                1, -- Time (seconds)
            },
            Cycles = {
                Min = 1,
                Max = 1,
                WaitTime = 2,
            },
            CamShake = {
                true, -- Enabled/Disabled
                {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
                100, -- Shake start distance (from Entity to you)
            },
            Jumpscare = {
                true, -- Enabled/Disabled
                {
                    Image1 = "rbxassetid://10483855823", -- Image1 url
                    Image2 = "rbxassetid://10483999903", -- Image2 url
                    Shake = true,
                    Sound1 = {
                        10483790459, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Sound2 = {
                        10483837590, -- SoundId
                        { Volume = 0.5 }, -- Sound properties
                    },
                    Flashing = {
                        true, -- Enabled/Disabled
                        Color3.fromRGB(0, 0, 255), -- Color
                    },
                    Tease = {
                        true, -- Enabled/Disabled
                        Min = 4,
                        Max = 4,
                    },
                },
            },
            CustomDialog = {"You died to Rush...", "your balls look dry", "Can I put some lotion on them?"}, -- Custom death message
        })
        
        -----[[ Advanced ]]-----
        entity.Debug.OnEntitySpawned = function(entityTable)
            print("Entity has spawned:", entityTable.Model)
        end
        
        entity.Debug.OnEntityDespawned = function(entityTable)
            print("Entity has despawned:", entityTable.Model)
        end
        
        entity.Debug.OnEntityStartMoving = function(entityTable)
            print("Entity has started moving:", entityTable.Model)
        end
        
        entity.Debug.OnEntityFinishedRebound = function(entityTable)
            print("Entity has finished rebound:", entityTable.Model)
        end
        
        entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
            print("Entity:", entityTable.Model, "has entered room:", room)
        end
        
        entity.Debug.OnLookAtEntity = function(entityTable)
            print("Player has looked at entity:", entityTable.Model)
        end
        
        entity.Debug.OnDeath = function(entityTable)
            warn("Player has died.")
        end
        ------------------------
        
        -- Run the created entity
        Creator.runEntity(entity)
        
    end
})

Tab:AddButton({
	Name = "香蕉枪(可在困难模式发射香蕉)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/BananaGunByNerd.lua"))()
  	end
})

Tab:AddButton({
	Name = "手持臭猫",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Maxwell%20Plushie"))()
  	end
})

Tab:AddButton({
	Name = "磁铁",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()
  	end
})

Tab:AddButton({
	Name = "荧光手电筒",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/kz3fxGaa", true))()
  	end    
})

Tab:AddButton({
	Name = "消失枪",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()
  	end    
})

Tab:AddButton({
	Name = "doors最强",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/R8QMbhzv'))()
  	end    
})

Tab:AddButton({
	Name = "十字架",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/ibbWwU6q'))()
  	end
})

Tab:AddToggle({
	Name = "灯光(别人看不见)",
	Default = false,
    Callback = function(Value)
        pcl.Enabled = Value
    end
})

Tab:AddButton({
	Name = "没有跳杀",
	Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
        end)
  	end    
})

Tab:AddButton({
	Name = "完成100关断路器盒子小游戏",
	Callback = function()
        game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
  	end    
})

Tab:AddButton({
	Name = "跳过50关",
	Callback = function()
        local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
  	end
})
local Tab = Window:MakeTab({
    Name = "各大脚本👍👍👍",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "小云V1.0.4)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYunbarkV1.0.4.lua"))()
end
})

Tab:AddButton({
	Name = "小云V1.0.6)真剧本多",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYun_currentedition_beta.lua"))()
end
})

Tab:AddButton({
	Name = "☁脚本",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiaos______________________________________________________________Yun__________________________________________________________________________betaV2.2------------------------------------------------------------------------------------jsja.lua"))()
  	end
})

Tab:AddButton({
    Name="XC",
    Callback=function()
        getgenv().XC="作者XC"
loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
    end
})

Tab:AddButton({
    Name="龙脚本",
    Callback=function()
        getgenv().long = "龙脚本，加载时间长请耐心"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\108\121\121\97\105\110\105\47\108\111\110\47\109\97\105\110\47\108\105\115\119\109\34\41\41\40\41")()
    end
})

Tab:AddButton({
	Name = "复制usa卡密",
	Callback = function()
     setclipboard("USA AER")
  	end
})

Tab:AddButton({
  Name = "USA（卡密：USA AER）",
  Callback = function()
    getgenv().USA="作者莫羽免费请勿倒卖"loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/USA.lua"))()
  end
})

Tab:AddButton({
	Name = "复制青脚本卡密",
	Callback = function()
     setclipboard("Green2023scriptkeyroblox")
  	end
})

Tab:AddButton({
  Name = "青脚本",
  Callback = function()
--支持游戏自然,doors,Evade,lifting simulator,x20 lifting simulator有3个没加上(懒)
local Green = "作者天隊QQ3585189460"
local key = "卡密在QQ群665141481"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\121\117\97\110\49\49\52\53\49\52\47\53\56\52\48\47\109\97\105\110\47\53\52\49\56\56\46\108\117\97\39\41\41\40\41\10")()
  end
})

Tab:AddButton({
    Name="水下",
    Callback=function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()
    end
})

Tab:AddButton({
    Name="导管",
    Callback=function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
    end
})

Tab:AddButton({
    Name="鸭",
    Callback=function()
loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()
    end
})

Tab:AddButton({
    Name="几把苗v1（无用）",
    Callback=function()
loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8736/473026?sign=Zy9IJu6oUjkHmDPw1YUPatfSBasClFJz3Y5TcmOofGY%3D%3A0"))()
    end
})

Tab:AddButton({
    Name="剑客v3333333👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍",
    Callback=function()
jianke_V3 = "作者_初夏"jianke = "剑客QQ群347724155"loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/jianke_V3')))()
    end
})

Tab:AddButton({
    Name="晴",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/llllll/main/%E5%91%83%E7%A0%B4%E8%A7%A3%E7%8B%97"))()
    end
})

Tab:AddButton({
    Name="鲨",
    Callback=function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sharksharksharkshark/shark-shark-shark-shark-shark/main/shark-scriptlollol.txt",true))()
    end
})

Tab:AddButton({
    Name="",
    Callback=function()

    end
})

local Tab = Window:MakeTab({
  Name = "FE变身脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

Tab:AddButton({
	Name = "FE SANS（不像）",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/i0yEjAry"))()
end
})

Tab:AddButton({
	Name = "FE Reaper",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/5rVDct9n"))()
end
})

Tab:AddButton({
	Name = "FE死侍",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/NVvdEySK"))()
end
})

Tab:AddButton({
	Name = "FE Knife",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/uAnpMVZR"))()
end
})

Tab:AddButton({
	Name = "Void BOSS",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/uP0MV6As"))()
end
})

Tab:AddButton({
	Name = "变大变小真的奇妙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/yRyNgpGE"))()
end
})

Tab:AddButton({
	Name = "FE PUNCH",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gBrRFj8K"))()
end
})

Tab:AddButton({
	Name = "FE DEATH",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/sUcgGXkC"))()
end
})

Tab:AddButton({
	Name = "炸服",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/eU2wngHG"))()
end
})

Tab:AddButton({
	Name = "FE Giant AXE",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/lrjtanrp/raw'),true))()
end
})

Tab:AddButton({
	Name = "FE Saitama",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/HgbE1e6E"))()
end
})

Tab:AddButton({
	Name = "FE giant eye",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/nXEnZrdH"))()
end
})

Tab:AddButton({
	Name = "FE帅气小刀刀",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/PTQQGkYG"))()
end
})

Tab:AddButton({
	Name = "FE月亮之刃",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/rTSxZGSQ"))()
end
})

Tab:AddButton({
	Name = "Among us（逆天）",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/f1LTmTPZ"))()
end
})

local Tab = Window:MakeTab({
	Name = "关于",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "BYd淼"
})

Tab:AddButton({
	Name = "复制作者QQ",
	Callback = function()
     setclipboard("BYD自己找")
  	end
})

Tab:AddButton({
	Name = "复制QQ群",
	Callback = function()
     setclipboard("BYD没有")
  	end
})

local Tab = Window:MakeTab({
	Name = "一路向西",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "防摔",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040712770")[1].Source)()
	end
})
Tab:AddButton({
	Name = "防套",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040719318")[1].Source)()
	end
})
Tab:AddButton({
	Name = "范围",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040722920")[1].Source)()
	end
})
Tab:AddButton({
	Name = "无后座，无限，超级",
	Callback = function()
	loadstring(game:GetObjects("rbxassetid://10040701935")[1].Source)()
	end
})

Tab:AddButton({
	Name = "小云V1.0.4)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYunbarkV1.0.4.lua"))()
end
})
Tab:AddButton({
	Name = "小云V1.0.6)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/XiaoYun_currentedition_beta.lua"))()
end
})
Tab:AddButton({
	Name = "云脚本2.0",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiao______________________________________________________________Yun__________________________________________________________________________betaV2.0.lua"))()
end
})

Tab:AddButton({
	Name = "微山白脚本",
	Callback = function()
	白脚本0.0.5(微山工作室)[已修复]loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\75\113\117\97\68\70\53\120\34\41\41\40\41\10")()
	end
})

Tab:AddButton({
	Name = "bf",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "10",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ThunderZ-HUB/HUB/main/Mobile-V2"))()
	end
})
Tab:AddButton({
	Name = "9",
	Callback = function()
		loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\101\115\116\120\101\109\99\104\117\97\47\97\103\97\103\97\103\97\113\47\109\97\105\110\47\85\105\47\104\104\104\46\108\117\97\34\41\41\40\41\10")()
	end
})
Tab:AddButton({
	Name = "7",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/BlodyXHub/ZeusHub/main/Loading_Ui"))()
	end
})
Tab:AddButton({
	Name = "6",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Loader", true))()
	end
})
Tab:AddButton({
	Name = "5",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/STRAW%20HUB%20RELEASE", true))()
	end
})
Tab:AddButton({
	Name = "4",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua'))()
	end
})

local Section = Tab:AddSection({
	Name = "超级大力士模拟器"
})
 
Tab:AddButton({
	Name = "传送到开始区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.86943817138672, 11.751949310302734, -198.07127380371094)
  	end    
})
 
Tab:AddButton({
	Name = "传送到健身区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93.60747528076172, 11.751947402954102, -10.266206741333008)
  	end    
})
 
Tab:AddButton({
	Name = "传送到食物区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.86384582519531, 11.751947402954102, 228.9690399169922)
  	end    
})
 
Tab:AddButton({
	Name = "传送到街机区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.99887084960938, 11.751949310302734, 502.90997314453125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到农场区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(85.6707763671875, 11.751947402954102, 788.5997314453125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到城堡区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.87281036376953, 11.84177017211914, 1139.7509765625)
  	end    
})
 
Tab:AddButton({
	Name = "传送到蒸汽朋克区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(92.63227081298828, 11.841767311096191, 1692.7890625)
  	end    
})
 
Tab:AddButton({
	Name = "传送到迪斯科区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.69613647460938, 16.015085220336914, 2505.213134765625)
  	end    
})
 
Tab:AddButton({
	Name = "传送到太空区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(88.42948150634766, 11.841769218444824, 3425.941650390625)
  	end    
})
 
Tab:AddButton({
	Name = "传送到糖果区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.55805969238281, 11.841663360595703, 4340.69921875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到实验室区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.00920867919922, 11.841663360595703, 5226.60205078125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到热带区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(80.26090240478516, 12.0902681350708, 6016.16552734375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到恐龙区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(38.4753303527832, 25.801530838012695, 6937.779296875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到复古区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.81867218017578, 12.89099407196045, 7901.74755859375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到冬季区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.47243881225586, 11.841662406921387, 8983.810546875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到深海区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105.36250305175781, 26.44820213317871, 9970.0849609375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到狂野西部区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(68.69414520263672, 15.108586311340332, 10938.654296875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到豪华公寓区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.75145721435547, 11.313281059265137, 12130.349609375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到宝剑战斗区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(111.25597381591797, 11.408829689025879, 12945.57421875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到童话区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(121.14932250976562, 11.313281059265137, 14034.50390625)
  	end    
})
 
Tab:AddButton({
	Name = "传送到桃花区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(108.2142333984375, 11.813281059265137, 15131.861328125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到厨房区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.78338623046875, 21.76291847229004, 16204.9755859375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到下水道区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47.36086654663086, 12.25178050994873, 17656.04296875)
  	end    
})
 
 
local Tab = Window:MakeTab({
	Name = "忍者传奇",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
 
 Tab:AddButton({
	Name = "北约",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/USA868/USA--/main/%E5%BF%8D%E8%80%85%E5%8C%97%E7%BA%A6%E6%B1%89%E5%8C%96.txt.bak?token=GHSAT0AAAAAACB6LLQWNTHNEXWB573LYAQCZCMX6RA"))()
	end
})

local Section = Tab:AddSection({
	Name = "忍者传奇"
})
 
Tab:AddButton({
	Name = "传送到出生点",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到附魔岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到星界岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.2932891845703, 2013.88037109375, 237.36672973632812)
  	end    
})
 
Tab:AddButton({
	Name = "传送到神秘岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
  	end    
})
 
Tab:AddButton({
	Name = "传送到太空岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
  	end    
})
 
Tab:AddButton({
	Name = "传送到冻土岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
  	end    
})
 
Tab:AddButton({
	Name = "传送到永恒岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
  	end    
})
 
Tab:AddButton({
	Name = "传送到沙暴岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
  	end    
})
 
Tab:AddButton({
	Name = "传送到雷暴岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
  	end    
})
 
Tab:AddButton({
	Name = "传送到远古炼狱岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
  	end    
})
 
Tab:AddButton({
	Name = "传送到午夜暗影岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
  	end    
})
 
Tab:AddButton({
	Name = "传送到神秘灵魂岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
  	end    
})
 
Tab:AddButton({
	Name = "传送到冬季奇迹岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
  	end    
})
 
Tab:AddButton({
	Name = "传送到黄金大师岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
  	end    
})
 
Tab:AddButton({
	Name = "传送到龙传奇岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
  	end    
})
 
Tab:AddButton({
	Name = "传送到赛博传奇岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
  	end    
})
 
Tab:AddButton({
	Name = "传送到天岚超能岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
  	end    
})
 
Tab:AddButton({
	Name = "传送到混沌传奇岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
  	end    
})
 
Tab:AddButton({
	Name = "传送到灵魂融合岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
  	end    
})
 
Tab:AddButton({
	Name = "传送到黑暗元素岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
  	end    
})
 
Tab:AddButton({
	Name = "传送到内心和平岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
  	end    
})
 
Tab:AddButton({
	Name = "传送到炽烈漩涡岛",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
  	end    
})
 
Tab:AddButton({
	Name = "传送到35倍金币区域",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
  	end    
})
 
Tab:AddButton({
	Name = "传送到死亡宠物",
	Callback = function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
  	end    
})

local Tab = Window:MakeTab({
	Name = "DOORS",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "门",
	Callback = function()
loadstring(game:HttpGet("https://github.com/DocYogurt/free/raw/main/long"))()
end
})
Tab:AddButton({
	Name = "自动完成",
	Callback = function()
	loadstring(game:HttpGet('https://reddyhub.xyz/loader.html'))()
end
})
Tab:AddButton({
	Name = "不坤到什么名字",
	Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))()
end
})
Tab:AddButton({
	Name = "穿墙(无拉回)",
	Callback = function()
loadstring(game:HttpGet("https://github.com/DXuwu/OK/raw/main/clip"))()
end
})
Tab:AddButton({
	Name = "变身(阿巴怪提供)",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end
})
Tab:AddButton({
	Name = "微山2.3.2(依旧是阿巴怪提供)",
	Callback = function()
--微山doors 2.3.2(愚人节快乐)
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
end
})

local Tab = Window:MakeTab({
	Name = "蜂群模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "蜂",
	Callback = function()	
	loadstring(game:HttpGet("https://roblox.servegame.com/roblox_bss/chocmoc.lua"))()
		end
})

local Tab = Window:MakeTab({
	Name = "宠物X",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "云宠物",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/T34M-V0ID/cloud-hub/main/cloud"))()
	end
})

local Tab = Window:MakeTab({
	Name = "脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "操人脚本",
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/bzmhRgKL'))()
	end
})
Tab:AddButton({
	Name = "动感星期五",
	Callback = function()	
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ShowerHead-FluxTeam/scripts/main/funky-friday-autoplay'))()
		end
})
Tab:AddButton({
	Name = "白脚本(已修复)",
	Callback = function()
_G["白脚本作者修狗"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(('https://raw.githubusercontent.com/wev666666/baijiaobengV2.0beta/main/%E7%99%BD%E8%84%9A%E6%9C%ACbeta'),true))() 
end
})
Tab:AddButto+n({
	Name = "踢人",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua'))()
	end
})

local about = Window:MakeTab({
    Name = "2b🖐️🖐️🖐️公告",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButto+n({
	Name = "作者 淼",
	Callback=function
	end
})

Tab:AddButto+n({
	Name = "帮助：无",
	Callback=function
	end

OrionLib:Init()