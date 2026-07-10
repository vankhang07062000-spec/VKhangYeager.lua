local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomChat"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Nút Chat
local toggle = Instance.new("TextButton")
toggle.Parent = gui
toggle.Size = UDim2.new(0,5,0,50)
toggle.Position = UDim2.new(0,20,0.5,-30)
toggle.Text = "🇻🇳"
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(35,35,35)
toggle.TextColor3 = Color3.new(1,1,1)

-- Khung chat
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,300,0,120)
frame.Position = UDim2.new(0.5,-150,0.7,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Visible = false

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,10)
corner.Parent = frame

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(1,-20,0,40)
box.Position = UDim2.new(0,10,0,10)
box.PlaceholderText = "Nhập tin nhắn..."
box.Text = ""

local send = Instance.new("TextButton")
send.Parent = frame
send.Size = UDim2.new(1,-20,0,40)
send.Position = UDim2.new(0,10,0,60)
send.Text = "Gửi"

toggle.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

local function MakeDraggable(obj)
	local dragging = false
	local dragStart
	local startPos

	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = obj.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch) then

			local delta = input.Position - dragStart
			obj.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

MakeDraggable(toggle)
MakeDraggable(frame)

local function SendMessage()
	local text = box.Text
	if text ~= "" then
		local channels = TextChatService:FindFirstChild("TextChannels")
		if channels then
			local general = channels:FindFirstChild("RBXGeneral")
			if general then
				general:SendAsync(text)
			end
		end
		box.Text = ""
	end
end

send.MouseButton1Click:Connect(SendMessage)

box.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		SendMessage()
	end
end)

-- FIX LAG CỰC MẠNH

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

Lighting.GlobalShadows = false
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogStart = 0
Lighting.FogEnd = 100000
Lighting.Ambient = Color3.new(1,1,1)
Lighting.OutdoorAmbient = Color3.new(1,1,1)

if Terrain then
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 1
end

pcall(function()
	Lighting.Clouds:Destroy()
end)

for _,v in ipairs(Lighting:GetChildren()) do
	if v:IsA("Atmosphere")
	or v:IsA("Sky")
	or v:IsA("BloomEffect")
	or v:IsA("SunRaysEffect")
	or v:IsA("ColorCorrectionEffect")
	or v:IsA("BlurEffect")
	or v:IsA("DepthOfFieldEffect") then
		v:Destroy()
	end
end

task.spawn(function()
	while task.wait(3) do
		for _,v in ipairs(workspace:GetDescendants()) do
			if v:IsA("ParticleEmitter")
			or v:IsA("Trail")
			or v:IsA("Smoke")
			or v:IsA("Fire")
			or v:IsA("Sparkles")
			or v:IsA("Explosion") then
				v:Destroy()
			end
		end
	end
end)

local logo = Instance.new("TextLabel")
logo.Parent = gui
logo.Size = UDim2.new(0,150,0,30)
logo.Position = UDim2.new(1,-190,0,10)
logo.BackgroundTransparency = 1
logo.Text = " nhớ fl nha❤️@yrid_raden_or🇻🇳"
logo.TextColor3 = Color3.fromRGB(255,255,255)
logo.TextStrokeTransparency = 0.5
logo.TextScaled = true
logo.Font = Enum.Font.GothamBold
logo.TextXAlignment = Enum.TextXAlignment.Right

local stroke = Instance.new("UIStroke")
stroke.Parent = logo
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(0,170,255)
