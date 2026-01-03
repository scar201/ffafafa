-- ════════════════════════════════════════════════════════
-- 😈 ULTIMATE CHAOS HUB - النسخة النهائية
-- أقوى 10 سكربتات حقيقية مدمجة في GUI واحد
-- كلها FE (تظهر للجميع!)
-- ════════════════════════════════════════════════════════

-- تحميل المكتبات
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
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "UltimateChaosHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Gradient
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 10, 10)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 0, 0))
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
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Font = Enum.Font.GothamBold
Title.Text = "😈 ULTIMATE CHAOS HUB 😈"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.5

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0, 0, 0, 55)
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "أقوى 10 سكربتات FE مدمجة"
Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.TextSize = 12

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.92, 0, 0.02, 0)
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
ScrollFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.8, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 10)

-- ════════════════════════════════════════════════════════
-- دالة إنشاء الأزرار
-- ════════════════════════════════════════════════════════

local function CreateButton(name, description, color, callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local ButtonStroke = Instance.new("UIStroke")
    local DescLabel = Instance.new("TextLabel")
    
    Button.Parent = ScrollFrame
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(1, 0, 0, 70)
    Button.Font = Enum.Font.GothamBold
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.TextXOffset = 15
    Button.TextYOffset = -10
    
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button
    
    ButtonStroke.Color = color
    ButtonStroke.Thickness = 2
    ButtonStroke.Transparency = 0.5
    ButtonStroke.Parent = Button
    
    DescLabel.Parent = Button
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0, 15, 0.5, 0)
    DescLabel.Size = UDim2.new(1, -30, 0.4, 0)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = description
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextSize = 11
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextWrapped = true
    
    Button.MouseButton1Click:Connect(callback)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0,
            Thickness = 3
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0.5,
            Thickness = 2
        }):Play()
    end)
end

-- ════════════════════════════════════════════════════════
-- 1. TOUCH FLING (97K+ VIEWS - PROVEN)
-- ════════════════════════════════════════════════════════

CreateButton(
    "💥 TOUCH FLING",
    "أقوى Fling - 97K views - لمسهم = يطيروا للفضاء!",
    Color3.fromRGB(255, 0, 102),
    function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "💥 Touch Fling";
            Text = "تم التفعيل! المسهم = يطيروا!";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 2. INFINITE YIELD (الأشهر عالمياً)
-- ════════════════════════════════════════════════════════

CreateButton(
    "👑 INFINITE YIELD",
    "أشهر Admin Script - 300+ أمر - Universal",
    Color3.fromRGB(0, 170, 255),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "👑 Infinite Yield";
            Text = "تم التفعيل! اكتب ;cmds للأوامر";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 3. FLN-X (MOBILE FLING - LIGHTWEIGHT)
-- ════════════════════════════════════════════════════════

CreateButton(
    "📱 FLN-X FLING",
    "Fling للموبايل - خفيف - قوي - GUI سهل",
    Color3.fromRGB(0, 255, 136),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LiarRise/FLN-X/refs/heads/main/README.md"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "📱 FLN-X";
            Text = "تم التفعيل! يشتغل موبايل + PC";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 4. SYSTEM BROKEN (20+ TROLL FEATURES)
-- ════════════════════════════════════════════════════════

CreateButton(
    "🎪 SYSTEM BROKEN",
    "20+ ميزة تخريب - Superman Fly - Headsit - Bang",
    Color3.fromRGB(255, 170, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🎪 System Broken";
            Text = "تم التفعيل! 20+ ميزة تخريب!";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 5. DARK DEX V3 (EXPLORER)
-- ════════════════════════════════════════════════════════

CreateButton(
    "🔍 DARK DEX V3",
    "مستكشف اللعبة - استكشف كل شي - للمحترفين",
    Color3.fromRGB(170, 0, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🔍 Dark Dex";
            Text = "تم التفعيل! Explorer جاهز";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 6. SIMPLE SPY (REMOTE SPY)
-- ════════════════════════════════════════════════════════

CreateButton(
    "🔧 SIMPLE SPY",
    "مراقبة RemoteEvents - للبحث عن ثغرات",
    Color3.fromRGB(255, 255, 0),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🔧 Simple Spy";
            Text = "تم التفعيل! راقب RemoteEvents";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 7. UNIVERSAL FLY (أخف طيران)
-- ════════════════════════════════════════════════════════

CreateButton(
    "✈️ UNIVERSAL FLY",
    "أخف سكربت طيران - WASD للتحكم",
    Color3.fromRGB(0, 255, 255),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Fly/refs/heads/main/Fly"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "✈️ Fly Enabled";
            Text = "WASD + Space + Shift للتحكم";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 8. CHAT BYPASS (تخطي فلتر الشات)
-- ════════════════════════════════════════════════════════

CreateButton(
    "🗣️ CHAT BYPASS",
    "تخطي فلتر الشات - اكتب أي شي - F للتفعيل",
    Color3.fromRGB(255, 100, 180),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/additional/betterbypasser"))()({ Method = 1, Keybind = "F" })
        game.StarterGui:SetCore("SendNotification", {
            Title = "🗣️ Chat Bypass";
            Text = "تم التفعيل! اضغط F لتخطي الفلتر";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 9. FLING THINGS & PEOPLE SCRIPT
-- ════════════════════════════════════════════════════════

CreateButton(
    "🎮 FLING GAME SCRIPT",
    "سكربت لعبة Fling Things - Super Power - Anti Grab",
    Color3.fromRGB(255, 50, 50),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Khoaispr0123/FlingScript/refs/heads/main/ILoveU.lua"))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "🎮 Fling Game";
            Text = "تم التفعيل! للعبة Fling Things";
            Duration = 5;
        })
    end
)

-- ════════════════════════════════════════════════════════
-- 10. NAMELESS ADMIN (350+ COMMANDS)
-- ════════════════════════════════════════════════════════

CreateButton(
    "⚡ NAMELESS ADMIN",
    "350+ أمر - واجهة أجمل من Infinite Yield",
    Color3.fromRGB(100, 255, 100),
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
        game.StarterGui:SetCore("SendNotification", {
            Title = "⚡ Nameless Admin";
            Text = "تم التفعيل! ;cmds للأوامر";
            Duration = 5;
        })
    end
)

-- Update Canvas Size
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "😈 ULTIMATE CHAOS HUB";
    Text = "تم التحميل بنجاح!\\nكل السكربتات FE - تظهر للجميع!";
    Duration = 7;
})

print("════════════════════════════════════════")
print("😈 ULTIMATE CHAOS HUB LOADED")
print("✅ 10 أقوى سكربتات حقيقية")
print("✅ كلها FE - تظهر للجميع!")
print("✅ Touch Fling - 97K views")
print("✅ Infinite Yield - الأشهر")
print("✅ System Broken - 20+ ميزة")
print("✅ Dark Dex - Explorer")
print("✅ +6 سكربتات قوية أخرى")
print("════════════════════════════════════════")
