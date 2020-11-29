-- Made by sadneo --
local TARGET_NAME = "TARGET NAME HERE"


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local target = Players:FindFirstChild(TARGET_NAME)
local player = Players.LocalPlayer

local summoned = false
local barraging = false
local punchAnimationTrack = nil
local offsetCFrame = CFrame.new(3, 1, 3)



-- set animation yes
if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    local punchAnimation = Instance.new("Animation")
    punchAnimation.AnimationId = "rbxassetid://2515090838"
    player.Character.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
    punchAnimationTrack = player.Character.Humanoid:LoadAnimation(punchAnimation)
end

local function punch()
    punchAnimationTrack:Play()
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.Q then
        summoned = not summoned
    elseif input.KeyCode == Enum.KeyCode.E then
        barraging = true
    elseif input.KeyCode == Enum.KeyCode.R then
        punch()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        barraging = false
    end
end)

RunService.Stepped:Connect(function()
    if summoned == true then
        player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame:ToWorldSpace(offsetCFrame)
        player.Character.Humanoid:ChangeState(11)
    end
end)

local barrage = coroutine.create(function()
    while barraging == true do
        punch()
        wait(1)
    end
end)
coroutine.resume(barrage)
