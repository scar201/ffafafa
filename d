-- ════════════════════════════════════════════════════════
-- 😈 ULTIMATE TROLL HUB - GUI EDITION
-- سكربت التخريب الأسطوري مع واجهة خرافية
-- احفظه في GitHub واستخدمه مع Solara!
-- ════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- ═══════════ المتغيرات ═══════════
local TrollEnabled = {
    Fling = false,
    Tornado = false,
    Invisible = false,
    FakeChat = false,
    CloneArmy = false,
    Disco = false,
    Speed = false,
    SuperJump = false,
    Noclip = false,
    KillAura = false,
    Fly = false,
}

local Connections = {}
local OriginalSpeed = 16
local OriginalJump = 50
local Flying = false
local FlySpeed = 100

-- ═══════════ الوظائف الأساسية ═══════════

-- Fling All Players
local function FlingAll()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            pcall(function()
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity = Vector3.new(
                        math.random(-150, 150),
                        math.random(150, 250),
                        math.random(-150, 150)
                    )
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Parent = targetRoot
                    game:GetService("Debris"):AddItem(bv, 0.3)
                end
            end)
        end
    end
end

-- Tornado Effect
local function StartTornado()
    local angle = 0
    Connections.Tornado = RunService.Heartbeat:Connect(function()
        angle = angle + 15
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                pcall(function()
                    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        local radius = 25
                        local x = math.cos(math.rad(angle)) * radius
                        local z = math.sin(math.rad(angle)) * radius
                        local y = math.sin(math.rad(angle * 2)) * 10
                        
                        targetRoot.CFrame = RootPart.CFrame * CFrame.new(x, y + 15, z)
                    end
                end)
            end
        end
    end)
end

local function StopTornado()
    if Connections.Tornado then
        Connections.Tornado:Disconnect()
        Connections.Tornado = nil
    end
end

-- Invisible Mode
local function SetInvisible(enabled)
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = enabled and 1 or 0
        elseif part:IsA("Decal") then
            part.Transparency = enabled and 1 or 0
        end
    end
    
    if Character:FindFirstChild("Head") then
        local face = Character.Head:FindFirstChild("face")
        if face then
            face.Transparency = enabled and 1 or 0
        end
    end
end

-- Fake Chat Spam
local function SendFakeChat()
    local messages = {
        "😈 TROLLED BY ULTIMATE HUB 😈",
        "🔥 GET DESTROYED 🔥",
        "💀 YOU JUST GOT PRANKED 💀",
        "⚡ ULTIMATE TROLL ACTIVATED ⚡",
        "🌪️ CHAOS MODE ENABLED 🌪️"
    }
    
    for i = 1, 15 do
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                messages[math.random(1, #messages)],
                "All"
            )
        end)
        wait(0.15)
    end
end

-- Clone Army
local function CreateCloneArmy()
    for i = 1, 25 do
        pcall(function()
            local clone = Character:Clone()
            clone.Parent = workspace
            
            -- إزالة السكربتات من الكلون
            for _, obj in pairs(clone:GetDescendants()) do
                if obj:IsA("LocalScript") or obj:IsA("Script") then
                    obj:Destroy()
                end
            end
            
            clone.HumanoidRootPart.CFrame = RootPart.CFrame * CFrame.new(
                math.random(-15, 15),
                math.random(-2, 2),
                math.random(-15, 15)
            )
            
            -- حذف بعد 8 ثواني
            game:GetService("Debris"):AddItem(clone, 8)
        end)
        wait(0.05)
    end
end

-- Disco Mode
local function StartDisco()
    Connections.Disco = RunService.Heartbeat:Connect(function()
        pcall(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Color = Color3.fromRGB(
                        math.random(0, 255),
                        math.random(0, 255),
                        math.random(0, 255)
                    )
                    obj.Material = Enum.Material.Neon
                end
            end
        end)
    end)
end

local function StopDisco()
    if Connections.Disco then
        Connections.Disco:Disconnect()
        Connections.Disco = nil
    end
end

-- Speed Hack
local function ToggleSpeed(enabled)
    if enabled then
        Humanoid.WalkSpeed = 200
    else
        Humanoid.WalkSpeed = OriginalSpeed
    end
end

-- Super Jump
local function ToggleSuperJump(enabled)
    if enabled then
        Humanoid.JumpPower = 250
        Humanoid.JumpHeight = 250
    else
        Humanoid.JumpPower = OriginalJump
        Humanoid.JumpHeight = 7.2
    end
end

-- Noclip
local function StartNoclip()
    Connections.Noclip = RunService.Stepped:Connect(function()
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

local function StopNoclip()
    if Connections.Noclip then
        Connections.Noclip:Disconnect()
        Connections.Noclip = nil
    end
    
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.CanCollide = true
        end
    end
end

-- Kill Aura
local function StartKillAura()
    Connections.KillAura = RunService.Heartbeat:Connect(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                pcall(function()
                    local targetHum = player.Character:FindFirstChildOfClass("Humanoid")
                    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if targetHum and targetRoot then
                        local distance = (RootPart.Position - targetRoot.Position).Magnitude
                        if distance < 25 then
                            targetHum.Health = 0
                        end
                    end
                end)
            end
        end
    end)
end

local function StopKillAura()
    if Connections.KillAura then
        Connections.KillAura:Disconnect()
        Connections.KillAura = nil
    end
end

-- Fly Mode
local function StartFly()
    Flying = true
    
    local bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = RootPart.CFrame
    bg.Parent = RootPart
    
    local bv = Instance.new("BodyVelocity")
    bv.velocity = Vector3.new(0, 0, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Parent = RootPart
    
    Connections.Fly = RunService.Heartbeat:Connect(function()
        if not Flying then return end
        
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end
        
        bv.velocity = moveDirection * FlySpeed
        bg.cframe = camera.CFrame
    end)
end

local function StopFly()
    Flying = false
    
    if Connections.Fly then
        Connections.Fly:Disconnect()
        Connections.Fly = nil
    end
    
    for _, obj in pairs(RootPart:GetChildren()) do
        if obj:IsA("BodyGyro") or obj:IsA("BodyVelocity") then
            obj:Destroy()
        end
    end
end

-- ═══════════ GUI الخرافي ═══════════

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "UltimateTrollHub"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame مع تصميم خرافي
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- تدرج لوني خرافي
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 0, 0)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 0, 0))
}
UIGradient.Rotation = 90
UIGradient.Parent = MainFrame

-- إطار مضيء
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 3
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

-- عنوان خرافي
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 70)
Title.Font = Enum.Font.GothamBold
Title.Text = "😈 ULTIMATE TROLL HUB 😈"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 26
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- تأثير وميض للعنوان
spawn(function()
    while wait(0.5) do
        TweenService:Create(Title, TweenInfo.new(0.5), {
            TextColor3 = Color3.fromRGB(255, 50, 50)
        }):Play()
        wait(0.5)
        TweenService:Create(Title, TweenInfo.new(0.5), {
            TextColor3 = Color3.fromRGB(255, 0, 0)
        }):Play()
    end
end)

-- زر الإغلاق
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.91, 0, 0.025, 0)
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    -- إيقاف كل الميزات
    for feature, _ in pairs(TrollEnabled) do
        TrollEnabled[feature] = false
    end
    StopTornado()
    StopDisco()
    StopNoclip()
    StopKillAura()
    StopFly()
    
    ScreenGui:Destroy()
end)

-- Scroll Frame
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0.05, 0, 0.14, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.82, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

UIListLayout.Parent = ScrollFrame
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- دالة إنشاء زر خرافي
local function CreateButton(name, emoji, color, callback)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local ButtonStroke = Instance.new("UIStroke")
    local StatusLabel = Instance.new("TextLabel")
    
    Button.Parent = ScrollFrame
    Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button.Size = UDim2.new(1, 0, 0, 55)
    Button.Font = Enum.Font.GothamBold
    Button.Text = emoji .. "  " .. name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 15
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.TextXOffset = 15
    
    ButtonCorner.CornerRadius = UDim.new(0, 12)
    ButtonCorner.Parent = Button
    
    ButtonStroke.Color = color
    ButtonStroke.Thickness = 2
    ButtonStroke.Transparency = 0.5
    ButtonStroke.Parent = Button
    
    StatusLabel.Parent = Button
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0.75, 0, 0, 0)
    StatusLabel.Size = UDim2.new(0.23, 0, 1, 0)
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.Text = "OFF"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    StatusLabel.TextSize = 14
    
    Button.MouseButton1Click:Connect(function()
        callback(Button, StatusLabel)
    end)
    
    -- تأثير Hover خرافي
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0,
            Thickness = 3
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        }):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
            Transparency = 0.5,
            Thickness = 2
        }):Play()
    end)
    
    return Button, StatusLabel
end

-- إنشاء الأزرار
CreateButton("Fling All Players", "💥", Color3.fromRGB(255, 0, 102), function(btn, status)
    TrollEnabled.Fling = not TrollEnabled.Fling
    
    if TrollEnabled.Fling then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        spawn(function()
            while TrollEnabled.Fling do
                FlingAll()
                wait(0.4)
            end
        end)
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

CreateButton("Tornado Troll", "🌪️", Color3.fromRGB(0, 170, 255), function(btn, status)
    TrollEnabled.Tornado = not TrollEnabled.Tornado
    
    if TrollEnabled.Tornado then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        StartTornado()
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        StopTornado()
    end
end)

CreateButton("Invisible Mode", "👻", Color3.fromRGB(170, 0, 255), function(btn, status)
    TrollEnabled.Invisible = not TrollEnabled.Invisible
    
    if TrollEnabled.Invisible then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        SetInvisible(true)
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        SetInvisible(false)
    end
end)

CreateButton("Fake Chat Spam", "🎭", Color3.fromRGB(255, 170, 0), function(btn, status)
    status.Text = "..."
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    spawn(function()
        SendFakeChat()
        wait(3)
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end)
end)

CreateButton("Clone Army", "🎪", Color3.fromRGB(0, 255, 136), function(btn, status)
    status.Text = "..."
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    spawn(function()
        CreateCloneArmy()
        wait(2)
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end)
end)

CreateButton("Disco Mode", "🌈", Color3.fromRGB(255, 0, 255), function(btn, status)
    TrollEnabled.Disco = not TrollEnabled.Disco
    
    if TrollEnabled.Disco then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        StartDisco()
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        StopDisco()
    end
end)

CreateButton("Super Speed", "⚡", Color3.fromRGB(255, 255, 0), function(btn, status)
    TrollEnabled.Speed = not TrollEnabled.Speed
    
    if TrollEnabled.Speed then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        ToggleSpeed(true)
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        ToggleSpeed(false)
    end
end)

CreateButton("Super Jump", "🦘", Color3.fromRGB(0, 255, 255), function(btn, status)
    TrollEnabled.SuperJump = not TrollEnabled.SuperJump
    
    if TrollEnabled.SuperJump then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        ToggleSuperJump(true)
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        ToggleSuperJump(false)
    end
end)

CreateButton("Noclip", "🚶", Color3.fromRGB(255, 102, 0), function(btn, status)
    TrollEnabled.Noclip = not TrollEnabled.Noclip
    
    if TrollEnabled.Noclip then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        StartNoclip()
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        StopNoclip()
    end
end)

CreateButton("Kill Aura", "💀", Color3.fromRGB(255, 0, 0), function(btn, status)
    TrollEnabled.KillAura = not TrollEnabled.KillAura
    
    if TrollEnabled.KillAura then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        StartKillAura()
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        StopKillAura()
    end
end)

CreateButton("Fly Mode", "✈️", Color3.fromRGB(0, 200, 255), function(btn, status)
    TrollEnabled.Fly = not TrollEnabled.Fly
    
    if TrollEnabled.Fly then
        status.Text = "ON"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        StartFly()
    else
        status.Text = "OFF"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        StopFly()
    end
end)

-- تحديث Canvas Size
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
end)

-- إشعار بالتحميل
game.StarterGui:SetCore("SendNotification", {
    Title = "😈 ULTIMATE TROLL HUB";
    Text = "تم التحميل بنجاح!\nاستمتع بالتخريب 🔥";
    Duration = 6;
})

print("════════════════════════════════════════")
print("😈 ULTIMATE TROLL HUB")
print("✅ تم التحميل بنجاح!")
print("🔥 GUI جاهز - استمتع بالفوضى!")
print("════════════════════════════════════════")
