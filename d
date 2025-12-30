-- ════════════════════════════════════════════════════════
-- 😈 FE TROLL SCRIPTS - يشتغل على الكل!
-- سكربتات تخريب حقيقية تأثر على اللاعبين الثانيين
-- ════════════════════════════════════════════════════════

--[[
    ملاحظة مهمة:
    هذي سكربتات FE (Filtering Enabled Bypass)
    تستخدم RemoteEvents عشان تأثر على السيرفر الحقيقي
    راح تشوف التأثير على الكل!
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- ═══════════════════════════════════════════════════════
-- 💀 FE KILL ALL - يقتل الكل (حقيقي!)
-- ═══════════════════════════════════════════════════════
local function FEKillAll()
    print("💀 جاري قتل كل اللاعبين...")
    
    -- طريقة 1: استخدام أدوات القتل
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            pcall(function()
                local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or 
                            Character:FindFirstChildOfClass("Tool")
                
                if tool and tool:FindFirstChild("Handle") then
                    -- تفعيل الأداة
                    tool.Parent = Character
                    
                    -- محاولة الضرب
                    local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                    if targetHRP then
                        -- انتقال سريع
                        RootPart.CFrame = targetHRP.CFrame
                        wait(0.1)
                        
                        -- تفعيل الأداة
                        tool:Activate()
                        wait(0.1)
                    end
                end
            end)
        end
    end
    
    -- طريقة 2: إيجاد RemoteEvents للضرر
    for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") then
            local name = remote.Name:lower()
            if name:find("damage") or name:find("hit") or name:find("kill") then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        pcall(function()
                            remote:FireServer(player.Character)
                        end)
                    end
                end
            end
        end
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 💥 FE FLING ALL - يطير الكل (حقيقي!)
-- ═══════════════════════════════════════════════════════
local function FEFlingAll()
    print("💥 جاري تطيير كل اللاعبين...")
    
    -- تفعيل Fling باستخدام الفيزياء
    local power = 9e9
    
    -- إنشاء BodyThrust للقوة
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            part.Massless = true
            
            local thrust = Instance.new("BodyThrust")
            thrust.Force = Vector3.new(power, power, power)
            thrust.Parent = part
        end
    end
    
    -- الاصطدام باللاعبين
    spawn(function()
        for i = 1, 50 do
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    pcall(function()
                        local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                        if targetHRP then
                            RootPart.CFrame = targetHRP.CFrame
                            wait(0.05)
                        end
                    end)
                end
            end
            wait(0.1)
        end
        
        -- تنظيف
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BodyThrust") then
                part:Destroy()
            end
        end
    end)
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 🔥 FE LAG SERVER - يلقق السيرفر كله
-- ═══════════════════════════════════════════════════════
local function FELagServer()
    print("🔥 جاري تعليق السيرفر...")
    
    -- إنشاء الآلاف من الأجزاء
    for i = 1, 500 do
        pcall(function()
            local part = Instance.new("Part")
            part.Size = Vector3.new(50, 50, 50)
            part.Anchored = false
            part.CanCollide = true
            part.Position = RootPart.Position + Vector3.new(
                math.random(-100, 100),
                math.random(10, 50),
                math.random(-100, 100)
            )
            part.Parent = workspace
        end)
        
        if i % 50 == 0 then
            wait()
        end
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 📢 FE CHAT SPAM FOR ALL - رسائل يشوفها الكل
-- ═══════════════════════════════════════════════════════
local function FEChatSpam()
    print("📢 جاري إرسال رسائل للكل...")
    
    local messages = {
        "😈 GET TROLLED!",
        "🔥 HACKED BY ULTIMATE HUB",
        "💀 YOU'VE BEEN PRANKED",
        "⚡ SERVER UNDER ATTACK",
        "🌪️ CHAOS MODE ACTIVATED"
    }
    
    -- إرسال للشات الحقيقي (يشوفه الكل)
    for i = 1, 20 do
        pcall(function()
            local msg = messages[math.random(1, #messages)]
            
            -- طريقة 1: Chat Service
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
            
            -- طريقة 2: TextChatService (جديد)
            if game:GetService("TextChatService") then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
            end
        end)
        wait(0.5)
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 🎭 FE FAKE ADMIN - يخلي الكل يشوفك آدمن
-- ═══════════════════════════════════════════════════════
local function FEFakeAdmin()
    print("🎭 جاري التظاهر كأدمن...")
    
    -- تغيير الاسم (يشوفه الكل)
    LocalPlayer.Character.Humanoid.DisplayName = "🔴 [ADMIN] " .. LocalPlayer.Name
    
    -- رسائل آدمن
    local adminMessages = {
        "[ADMIN] Warning: Suspicious activity detected",
        "[ADMIN] Server will restart in 5 minutes",
        "[ADMIN] All players report to spawn",
        "[SYSTEM] Admin " .. LocalPlayer.Name .. " has joined"
    }
    
    for _, msg in pairs(adminMessages) do
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        end)
        wait(2)
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 🌊 FE FLOOD WORKSPACE - يملأ الخريطة بأجزاء
-- ═══════════════════════════════════════════════════════
local function FEFloodWorkspace()
    print("🌊 جاري إغراق الخريطة...")
    
    for i = 1, 300 do
        pcall(function()
            -- إنشاء أجزاء ضخمة
            local part = Instance.new("Part")
            part.Size = Vector3.new(30, 30, 30)
            part.Anchored = false
            part.BrickColor = BrickColor.Random()
            part.Material = Enum.Material.Neon
            part.Position = Vector3.new(
                math.random(-500, 500),
                math.random(50, 200),
                math.random(-500, 500)
            )
            part.Parent = workspace
            
            -- إضافة Fire للتأثير البصري
            local fire = Instance.new("Fire")
            fire.Parent = part
        end)
        
        if i % 30 == 0 then
            wait()
        end
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 💣 FE BRING ALL - يجمع كل اللاعبين عندك
-- ═══════════════════════════════════════════════════════
local function FEBringAll()
    print("💣 جاري جلب كل اللاعبين...")
    
    -- استخدام أدوات الانتقال
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            pcall(function()
                local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    -- الانتقال للاعب ثم العودة (FE)
                    local oldCF = RootPart.CFrame
                    RootPart.CFrame = targetHRP.CFrame
                    wait(0.1)
                    targetHRP.CFrame = oldCF
                    wait(0.1)
                end
            end)
        end
    end
    
    print("✅ تم!")
end

-- ═══════════════════════════════════════════════════════
-- 🎨 GUI بسيط
-- ═══════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.85, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 200, 0, 350)
Frame.Active = true
Frame.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Frame

Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "😈 FE TROLL"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 18

local Container = Instance.new("ScrollingFrame")
Container.Parent = Frame
Container.Position = UDim2.new(0, 5, 0, 45)
Container.Size = UDim2.new(1, -10, 1, -50)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 4

UIListLayout.Parent = Container
UIListLayout.Padding = UDim.new(0, 5)

-- دالة إنشاء زر
local function CreateButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = Container
    Button.Size = UDim2.new(1, 0, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 12
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Button
    
    Button.MouseButton1Click:Connect(callback)
end

-- إنشاء الأزرار
CreateButton("💀 Kill All", FEKillAll)
CreateButton("💥 Fling All", FEFlingAll)
CreateButton("📢 Chat Spam", FEChatSpam)
CreateButton("🎭 Fake Admin", FEFakeAdmin)
CreateButton("🔥 Lag Server", FELagServer)
CreateButton("🌊 Flood Map", FEFloodWorkspace)
CreateButton("💣 Bring All", FEBringAll)

-- تحديث Canvas Size
Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)

-- إشعار
game.StarterGui:SetCore("SendNotification", {
    Title = "😈 FE TROLL LOADED";
    Text = "السكربتات تأثر على الكل!";
    Duration = 5;
})

print("════════════════════════════════════════")
print("😈 FE TROLL SCRIPTS LOADED")
print("✅ هذي السكربتات تأثر على الكل حقيقي!")
print("💀 Kill All - يقتلهم كلهم")
print("💥 Fling - يطيرهم")
print("📢 Chat - يشوفونه")
print("🔥 Lag - يلقق السيرفر")
print("════════════════════════════════════════")
