-- ════════════════════════════════════════════════════════
-- 😈 ULTIMATE CHAOS HUB - V3 COMPLETE
-- 10 أقوى سكربتات حقيقية FE في GUI واحد
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
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "ChaosHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 520, 0, 650)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Gradient
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 15)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 0, 0))
}
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

-- Border
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 3
UIStroke.Parent = MainFrame

-- Title
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "😈 ULTIMATE CHAOS HUB 😈"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 26
Title.TextStrokeTransparency = 0.3

-- Subtitle
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.Size = UDim2.new(1, 0, 0, 25)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "أقوى 10 سكربتات FE مجربة ومضمونة"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.TextSize = 13

-- Close Button
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.92, 0, 0.015, 0)
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Scroll Frame
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0.04, 0, 0.13, 0)
ScrollFrame.Size = UDim2.new(0.92, 0, 0.84, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- ════════════════════════════════════════════════════════
-- دالة إنشاء الأزرار
-- ════════════════════════════════════════════════════════

local function CreateButton(emoji, name, description, color, callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local ButtonStroke = Instance.new("UIStroke")
    local TitleLabel = Instance.new("TextLabel")
    local DescLabel = Instance.new("TextLabel")
    
    Button.Parent = ScrollFrame
    Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button.Size = UDim2.new(1, 0, 0, 75)
    Button.Text = ""
    Button.AutoButtonColor = false
    
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button
    
    ButtonStroke.Color = color
    ButtonStroke.Thickness = 2
    ButtonStroke.Transparency = 0.5
    ButtonStroke.Parent = Button
    
    TitleLabel.Parent = Button
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 8)
    TitleLabel.Size = UDim2.new(1, -30, 0, 25)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = emoji .. " " .. name
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 15
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    DescLabel.Parent = Button
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0, 15, 0, 35)
    DescLabel.Size = UDim2.new(1, -30, 0, 35)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = description
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextSize = 12
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top
    DescLabel.TextWrapped = true
    
    Button.MouseButton1Click:Connect(callback)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.15), {
            Transparency = 0,
            Thickness = 3
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.15), {
            Transparency = 0.5,
            Thickness = 2
        }):Play()
    end)
end

-- ════════════════════════════════════════════════════════
-- إنشاء الأزرار - 10 سكربتات
-- ════════════════════════════════════════════════════════

-- 1. TOUCH FLING
CreateButton(
    "💥",
    "TOUCH FLING",
    "أقوى Fling - 97K views - لمسهم = يطيروا للفضاء!",
    Color3.fromRGB(255, 0, 102),
    function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "💥 Touch Fling";
            Text = "تم! المس أي لاعب = يطير!";
            Duration = 4;
        })
    end
)

-- 2. INFINITE YIELD
CreateButton(
    "👑",
    "INFINITE YIELD",
    "أشهر Admin - 300+ أمر - ;cmds للأوامر",
    Color3.fromRGB(0, 170, 255),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "👑 Infinite Yield";
            Text = "تم! اكتب ;cmds";
            Duration = 4;
        })
    end
)

-- 3. SYSTEM BROKEN
CreateButton(
    "🎪",
    "SYSTEM BROKEN",
    "20+ ميزة تخريب - Superman Fly - Headsit - Bang",
    Color3.fromRGB(255, 170, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🎪 System Broken";
            Text = "تم! 20+ ميزة تخريب!";
            Duration = 4;
        })
    end
)

-- 4. NAMELESS ADMIN
CreateButton(
    "⚡",
    "NAMELESS ADMIN",
    "350+ أمر - واجهة أجمل - ;cmds للأوامر",
    Color3.fromRGB(100, 255, 100),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "⚡ Nameless Admin";
            Text = "تم! اكتب ;cmds";
            Duration = 4;
        })
    end
)

-- 5. DARK DEX V3
CreateButton(
    "🔍",
    "DARK DEX V3",
    "مستكشف اللعبة - شوف كل الملفات - للمحترفين",
    Color3.fromRGB(170, 0, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🔍 Dark Dex";
            Text = "تم! Explorer جاهز";
            Duration = 4;
        })
    end
)

-- 6. SIMPLE SPY
CreateButton(
    "🔧",
    "SIMPLE SPY",
    "راقب RemoteEvents - ابحث عن ثغرات",
    Color3.fromRGB(255, 255, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🔧 Simple Spy";
            Text = "تم! راقب الـ Remotes";
            Duration = 4;
        })
    end
)

-- 7. UNIVERSAL FLY
CreateButton(
    "✈️",
    "UNIVERSAL FLY",
    "أخف طيران - WASD + Space/Shift للتحكم",
    Color3.fromRGB(0, 255, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Fly/refs/heads/main/Fly"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "✈️ Fly";
            Text = "تم! WASD للطيران";
            Duration = 4;
        })
    end
)

-- 8. CHAT BYPASS
CreateButton(
    "🗣️",
    "CHAT BYPASS",
    "تخطي فلتر الشات - اكتب أي شي - F للتفعيل",
    Color3.fromRGB(255, 100, 180),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/additional/betterbypasser"))()({ Method = 1, Keybind = "F" })
        game.StarterGui:SetCore("SendNotification", {
            Title = "🗣️ Chat Bypass";
            Text = "تم! اضغط F للتخطي";
            Duration = 4;
        })
    end
)

-- 9. FLN-X MOBILE
CreateButton(
    "📱",
    "FLN-X FLING",
    "Fling للموبايل + PC - خفيف وقوي",
    Color3.fromRGB(0, 255, 136),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiarRise/FLN-X/refs/heads/main/README.md"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "📱 FLN-X";
            Text = "تم! موبايل + PC";
            Duration = 4;
        })
    end
)

-- 10. FLING GAME
CreateButton(
    "🎮",
    "FLING THINGS SCRIPT",
    "للعبة Fling Things - Anti Grab - Super Power",
    Color3.fromRGB(255, 50, 50),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Khoaispr0123/FlingScript/refs/heads/main/ILoveU.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🎮 Fling Game";
            Text = "تم! لعبة Fling Things";
            Duration = 4;
        })
    end
)

-- Update Canvas
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 15)
end)

-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "😈 CHAOS HUB";
    Text = "تم التحميل! 10 سكربتات FE جاهزة";
    Duration = 5;
})

print("════════════════════════════════════════")
print("😈 ULTIMATE CHAOS HUB V3")
print("✅ 10 سكربتات FE مضمونة")
print("✅ Touch Fling - 97K+ views")
print("✅ Infinite Yield - 300+ أمر")
print("✅ System Broken - 20+ ميزة")
print("✅ +7 سكربتات قوية")
print("════════════════════════════════════════")
