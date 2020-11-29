-- Made by sadneo --

local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextBox.Parent = ScreenGui
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "Write Target Name Here"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000
TextBox.Draggable = true


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local summoned = false
local barraging = false
local punchAnimationTrack = nil
local offsetCFrame = CFrame.new(3, 1, 3)
local tweenInfo = TweenInfo.new(.1)



-- set animation yes
if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
    local punchAnimation = Instance.new("Animation", player.Character)
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
        player.Character.HumanoidRootPart.CFrame = Players:FindFirstChild(TextBox.Text).Character.HumanoidRootPart.CFrame:ToWorldSpace(offsetCFrame)
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
