if Password == 00100200300 then
	local message = Instance.new("Message",workspace)
	message.Text = "Right password!"
	wait(2)
	message:Destroy()
	local ScreenGui = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local name = Instance.new("TextBox")
	local follow = Instance.new("TextButton")
	local tp = Instance.new("TextButton")
	local view = Instance.new("TextButton")
	local mouse = game.Players.LocalPlayer:GetMouse()
	getgenv().following = false
	getgenv().viewing = false
	getgenv().guiVisible = true

	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	main.Name = "main"
	main.Parent = ScreenGui
	main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main.Position = UDim2.new(0.639513135, 0, 0.640897751, 0)
	main.Size = UDim2.new(0, 317, 0, 212)

	name.Name = "name"
	name.Parent = main
	name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	name.Position = UDim2.new(0.167192429, 0, 0.105038047, 0)
	name.Size = UDim2.new(0, 210, 0, 50)
	name.Font = Enum.Font.SourceSans
	name.PlaceholderText = "Player Name"
	name.Text = ""
	name.TextColor3 = Color3.fromRGB(0, 0, 0)
	name.TextSize = 27.000

	follow.Name = "follow"
	follow.Parent = main
	follow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	follow.Position = UDim2.new(0.167192429, 0, 0.683962286, 0)
	follow.Size = UDim2.new(0, 105, 0, 50)
	follow.Font = Enum.Font.SourceSans
	follow.Text = "Follow"
	follow.TextColor3 = Color3.fromRGB(0, 0, 0)
	follow.TextSize = 25.000

	tp.Name = "tp"
	tp.Parent = main
	tp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tp.Position = UDim2.new(0.1671924, 0, 0.416358799, 0)
	tp.Size = UDim2.new(0, 105, 0, 50)
	tp.Font = Enum.Font.SourceSans
	tp.Text = "Teleport"
	tp.TextColor3 = Color3.fromRGB(0, 0, 0)
	tp.TextSize = 25.000

	view.Name = "view"
	view.Parent = main
	view.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	view.Position = UDim2.new(0.520504713, 0, 0.683962286, 0)
	view.Size = UDim2.new(0, 105, 0, 50)
	view.Font = Enum.Font.SourceSans
	view.Text = "View"
	view.TextColor3 = Color3.fromRGB(0, 0, 0)
	view.TextSize = 25.000

	follow.MouseButton1Click:Connect(function()
		if following == false then
			following = true
			followPlayer()
		else
			following = false
			game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Anchored = false
			follow.Text = "Follow"
		end
	end)

	function followPlayer()
		while following do
			local player = game.Players.LocalPlayer
			local target = game.Workspace:FindFirstChild(name.Text).HumanoidRootPart.CFrame
			if player.Character then
				player.Character.HumanoidRootPart.CFrame = target
				game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Anchored = true
				follow.Text = "Unfollow"
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

	view.MouseButton1Click:Connect(function()
		if viewing == false then
			viewing = true
			game.Workspace.Camera.CameraSubject = game.Workspace:FindFirstChild(name.Text).Humanoid
			view.Text = "Unview"
		else
			viewing = false
			game.Workspace.Camera.CameraSubject = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid
			view.Text = "View"
		end
	end)

	ScreenGui.Parent = game.CoreGui
	main.Active = true
	main.Draggable = true
	
	mouse.KeyDown:connect(function(k)
    		if k == "p" then
        		if guiVisible then
				guiVisible = false
				main.Visible = false
			else
				guiVisible = true
				main.Visible = true
			end
    		end
	end)
	
	mouse.KeyDown:connect(function(k)
    		if k == "x" then
			ScreenGui:Destroy()
		end
	end)
else
	local message = Instance.new("Message",workspace)
	message.Text = "Wrong password!"
	wait(2)
	message:Destroy()
end
