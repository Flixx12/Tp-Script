-- Gui to Lua
-- Version: 3.2

-- Instances:
if not Password == "00100200300" then
	print("Password is wrong!")
else
	local ScreenGui = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local name = Instance.new("TextBox")
	local follow = Instance.new("TextButton")
	local tp = Instance.new("TextButton")
	local following = false

	--Properties:

	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	main.Name = "main"
	main.Parent = ScreenGui
	main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main.Position = UDim2.new(0.639513135, 0, 0.640897751, 0)
	main.Size = UDim2.new(0, 317, 0, 212)

	name.Name = "name"
	name.Parent = main
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.Position = UDim2.new(0.164037853, 0, 0.12862283, 0)
	name.Size = UDim2.new(0, 212, 0, 50)
	name.Font = Enum.Font.SourceSans
	name.PlaceholderText = "Player Name"
	name.Text = ""
	name.TextColor3 = Color3.fromRGB(0, 0, 0)
	name.TextSize = 27.000
	name.TextWrapped = true

	follow.Name = "follow"
	follow.Parent = main
	follow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	follow.Position = UDim2.new(0.334384859, 0, 0.421075672, 0)
	follow.Size = UDim2.new(0, 105, 0, 50)
	follow.Font = Enum.Font.SourceSans
	follow.Text = "Follow"
	follow.TextColor3 = Color3.fromRGB(0, 0, 0)
	follow.TextSize = 25.000

	tp.Name = "tp"
	tp.Parent = main
	tp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tp.Position = UDim2.new(0.334384859, 0, 0.704094648, 0)
	tp.Size = UDim2.new(0, 105, 0, 50)
	tp.Font = Enum.Font.SourceSans
	tp.Text = "Teleport"
	tp.TextColor3 = Color3.fromRGB(0, 0, 0)
	tp.TextSize = 25.000

	follow.MouseButton1Click:Connect(function()
		if following == false then
			following = true
			follow()
		else
			following = false
		end
	end)

	function follow()
		while following do
			local player = game.Players.LocalPlayer
			local target = game.Workspace:FindFirstChild(name.Text).HumanoidRootPart.CFrame
			if player.Character then
				player.Character.HumanoidRootPart.CFrame = target
			end
			wait()
		end
	end

	tp.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		local target = game.Workspace:FindFirstChild(name.Text).HumanoidRootPart.CFrame
		if player.Character then
			player.Character.HumanoidRootPart.CFrame = target
		end
	end)

	ScreenGui.Parent = game.CoreGui
	main.Active = true
	main.Draggable = true
end
