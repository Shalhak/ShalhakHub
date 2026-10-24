-- ═══════════════════════════════════════════════════════════════
--  STEAL AN EGG — ShalhakHub Script
--  Auto Steal, Speed, Noclip
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

-- ── CONFIG ──────────────────────────────────────────────────────
local cfg = {
    autoSteal   = true,
    speed       = 50,
    noclip      = false,
    autoFarm    = true,
    range       = 20,
}

-- ── GUI ─────────────────────────────────────────────────────────
local existing = game.CoreGui:FindFirstChild("SAE_Hub")
if existing then existing:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SAE_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 240)
Frame.Position = UDim2.new(0, 10, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 32)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Title.Text = "🥚 STEAL AN EGG"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Title.Parent = Frame
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local function makeToggle(labelText, yPos, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -20, 0, 30)
    row.Position = UDim2.new(0, 10, 0, yPos)
    row.BackgroundTransparency = 1
    row.Parent = Frame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.75, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(210, 210, 210)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0, 36, 0, 18)
    bg.Position = UDim2.new(1, -36, 0.5, -9)
    bg.BackgroundColor3 = default and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(60, 60, 65)
    bg.Parent = row
    Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = default and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.Parent = bg
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local state = default
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = bg

    btn.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(bg, TweenInfo.new(0.15), {
            BackgroundColor3 = state and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(60, 60, 65)
        }):Play()
        TweenService:Create(knob, TweenInfo.new(0.15), {
            Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
        }):Play()
        callback(state)
    end)
end

makeToggle("Auto Steal",  40,  true,  function(v) cfg.autoSteal = v end)
makeToggle("Auto Farm",   76,  true,  function(v) cfg.autoFarm  = v end)
makeToggle("Speed x3",    112, false, function(v)
    hum.WalkSpeed = v and cfg.speed or 16
end)
makeToggle("Noclip",      148, false, function(v)
    cfg.noclip = v
end)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 20)
status.Position = UDim2.new(0, 10, 0, 210)
status.BackgroundTransparency = 1
status.Text = "Status: Actif"
status.TextColor3 = Color3.fromRGB(100, 220, 100)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = Frame

-- ── NOCLIP ──────────────────────────────────────────────────────
RunService.Stepped:Connect(function()
    if cfg.noclip and char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- ── AUTO STEAL / FARM ───────────────────────────────────────────
local function getEggs()
    local eggs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = obj.Name:lower()
            if name:find("egg") then
                local part = obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildOfClass("BasePart")) or obj
                if part then
                    table.insert(eggs, part)
                end
            end
        end
    end
    return eggs
end

local function teleportTo(part)
    if hrp and part then
        hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 3, 0))
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if not char or not hrp then
            char = lp.Character
            if char then
                hum = char:FindFirstChildOfClass("Humanoid")
                hrp = char:FindFirstChild("HumanoidRootPart")
            end
        end

        if cfg.autoSteal or cfg.autoFarm then
            local eggs = getEggs()
            local closest = nil
            local closestDist = math.huge

            for _, egg in ipairs(eggs) do
                local dist = (hrp.Position - egg.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closest = egg
                end
            end

            if closest then
                if closestDist > cfg.range then
                    teleportTo(closest)
                end
                status.Text = "Oeufs trouvés: " .. #eggs
            else
                status.Text = "Recherche oeufs..."
            end
        end
    end
end)

-- ── CHAR RESPAWN ────────────────────────────────────────────────
lp.CharacterAdded:Connect(function(c)
    char = c
    hum = c:WaitForChild("Humanoid")
    hrp = c:WaitForChild("HumanoidRootPart")
    if cfg.speed ~= 16 then
        hum.WalkSpeed = cfg.speed
    end
end)

print("[SAE] Script chargé.")
