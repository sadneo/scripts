local TARGET_NAME = "TARGET NAME HERE"



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local target = Players:FindFirstChild(TARGET_NAME)
local player = Players.LocalPlayer
local char = player.Character

local summoned = false
local offsetCFrame = CFrame.new(3, 1, 3)

-- set animation yes
if char.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
end

local function punch()

end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        summoned = not summoned
    elseif input.KeyCode == Enum.KeyCode.E then

    elseif input.KeyCode == Enum.KeyCode.R then
           
    end
end)

RunService.Stepped:Connect(function()
    if summoned == true then
        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame:ToWorldSpace(offsetCFrame)
        char.Humanoid:ChangeState(11)
    end
end)
