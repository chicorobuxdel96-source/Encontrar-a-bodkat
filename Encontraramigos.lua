local Players = game:GetService("Players")

local targetPlayerName = "NombreDelJugador"

local function markPlayer(player)
	if not player.Character then return end

	for _, v in pairs(player.Character:GetChildren()) do
		if v:IsA("Highlight") or v.Name == "MarkerGui" then
			v:Destroy()
		end
	end

	local highlight = Instance.new("Highlight")
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = player.Character
	highlight.Parent = player.Character

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "MarkerGui"
	billboard.Size = UDim2.new(0, 120, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = player.Character:WaitForChild("Head")

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.Text = "OBJETIVO"
	text.TextScaled = true
	text.TextColor3 = Color3.fromRGB(255, 0, 0)
	text.Parent = billboard
end

local targetPlayer = Players:FindFirstChild(targetPlayerName)
if targetPlayer then
	if targetPlayer.Character then
		markPlayer(targetPlayer)
	end
	targetPlayer.CharacterAdded:Connect(function()
		task.wait(1)
		markPlayer(targetPlayer)
	end)
end
