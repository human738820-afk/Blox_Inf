-- =================================================================
-- BLOX FRUITS - AUTOMATIC WATER WALK & INFINITE ENERGY
-- =================================================================

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    Workspace = game:GetService("Workspace")
}

local LocalPlayer = Services.Players.LocalPlayer

-- Create Water Walk Platform (Jesus Mode)
local WaterPlatform = Instance.new("Part")
WaterPlatform.Name = "JesusPlatform"
WaterPlatform.Size = Vector3.new(500, 1, 500)
WaterPlatform.Anchored = true
WaterPlatform.Transparency = 1
WaterPlatform.CanCollide = true
WaterPlatform.Parent = Services.Workspace

-- Core Loop (Runs automatically every frame)
Services.RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    local energy = char:FindFirstChild("Energy")

    -- 1. Walk on Water Engine
    if hrp and hum and hum.Health > 0 then
        WaterPlatform.CanCollide = true
        WaterPlatform.CFrame = CFrame.new(hrp.Position.X, 1, hrp.Position.Z)
    else
        WaterPlatform.CanCollide = false
    end

    -- 2. Infinite Energy Engine
    if energy then
        energy.Value = energy.MaxValue
    end
end)
