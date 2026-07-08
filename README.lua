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
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(0,20,0.5,-30)
toggle.Text = "💬"
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
-- FPS BOOST + FIX LAG
local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain

-- Ánh sáng + Xóa sương mù
Lighting.GlobalShadows = false
Lighting.Brightness = 2
Lighting.ClockTime = 14
Lighting.FogStart = 999999
Lighting.FogEnd = 999999999
Lighting.FogColor = Color3.new(1,1,1)
Lighting.EnvironmentDiffuseScale = 0
Lighting.EnvironmentSpecularScale = 0

-- Xóa mây
pcall(function()
	local clouds = Terrain:FindFirstChildOfClass("Clouds")
	if clouds then
		clouds:Destroy()
	end
end)

-- Giảm hiệu ứng nước
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 1

-- Xóa hiệu ứng
for _,v in ipairs(game:GetDescendants()) do
	if v:IsA("ParticleEmitter")
	or v:IsA("Trail")
	or v:IsA("Beam")
	or v:IsA("Smoke")
	or v:IsA("Fire")
	or v:IsA("Sparkles") then
		v.Enabled = false
	end

	if v:IsA("Explosion") then
		v:Destroy()
	end

	if v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	end

	if v:IsA("MeshPart") then
		pcall(function()
			v.RenderFidelity = Enum.RenderFidelity.Performance
		end)
	end
end

-- Tự động xóa hiệu ứng mới xuất hiện
game.DescendantAdded:Connect(function(v)
	if v:IsA("ParticleEmitter")
	or v:IsA("Trail")
	or v:IsA("Beam")
	or v:IsA("Smoke")
	or v:IsA("Fire")
	or v:IsA("Sparkles") then
		v.Enabled = false
	end
end)

print("FPS BOOST + NO FOG ENABLED")
-- ANTI AFK

P.Idled:Connect(function()

	VU:CaptureController()

	VU:ClickButton2(Vector2.new())

end)



print("🇻🇳 VKhang Yeager Loaded")
