local TARGET_NAME = "redh80"

local Players = game:GetService("Players")
local target = Players:FindFirstChild(TARGET_NAME)
local player = Players.LocalPlayer


player.Character.Humanoid.RequiresNeck = false
for i,bodyPart in pairs(player.Character:GetChildren()) do
	if bodyPart:IsA("BasePart") then
		bodyPart.CanCollide = true
		for i,v in pairs(part:GetChildren()) do
			if v:IsA("Motor6D") then
				if v.Name ~= "Neck" then
					v:Destroy()
				end
			end
		end
		for i,targetPart in pairs(target.Character:GetChildren()) do
			if v:IsA("BasePart") then
				if targetPart.Name == bodyPart.Name then
					local weld = Instance.new("Weld", bodyPart)
					weld.Part0 = bodyPart
					weld.Part1 = targetPart
					bodyPart.CFrame = targetPart.CFrame
				end
			end
		end
	end
end
