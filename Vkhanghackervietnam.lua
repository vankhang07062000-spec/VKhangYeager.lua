-- VKHANG YEAGER 🇻🇳 FINAL TEST MENU

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer


local gui = Instance.new("ScreenGui",player.PlayerGui)
gui.ResetOnSpawn=false


-- MENU

local menu = Instance.new("Frame",gui)
menu.Size = UDim2.new(0,230,0,390)
menu.Position=UDim2.new(.05,0,.3,0)
menu.BackgroundColor3=Color3.fromRGB(0,0,0)
menu.Active=true
menu.Draggable=true


local title=Instance.new("TextLabel",menu)
title.Size=UDim2.new(1,0,0,40)
title.Text="VKhang Yeager 🇻🇳"
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1
title.TextScaled=true



-- OPEN CLOSE

local open=Instance.new("TextButton",gui)
open.Size=UDim2.new(0,70,0,40)
open.Position=UDim2.new(0,10,0,10)
open.Text="MENU"


open.MouseButton1Click:Connect(function()
	menu.Visible=not menu.Visible
end)



local function Button(text,y)

local b=Instance.new("TextButton",menu)
b.Size=UDim2.new(.85,0,0,35)
b.Position=UDim2.new(.075,0,0,y)
b.Text=text

return b

end



local flySpeedBtn=Button("Fly Speed: 200",50)
local jumpBtn=Button("Jump OFF",90)
local jumpPowerBtn=Button("Jump: 50",130)
local noclipBtn=Button("Noclip OFF",170)
local lagBtn=Button("FIX LAG MAX",210)



-- FLY

local flyBtn=Instance.new("TextButton",gui)

flyBtn.Size=UDim2.new(0,90,0,50)
flyBtn.Position=UDim2.new(.75,0,.5,0)
flyBtn.Text="FLY OFF"
flyBtn.Active=true
flyBtn.Draggable=true


local fly=false
local flySpeed=200


flyBtn.MouseButton1Click:Connect(function()

fly=not fly

flyBtn.Text=fly and "FLY ON" or "FLY OFF"

end)



flySpeedBtn.MouseButton1Click:Connect(function()


flySpeed=flySpeed+50


if flySpeed>550 then
flySpeed=200
end


flySpeedBtn.Text="Fly Speed: "..flySpeed


end)



RunService.RenderStepped:Connect(function()


if fly and player.Character then


local root=player.Character:FindFirstChild("HumanoidRootPart")


if root then

root.AssemblyLinearVelocity =
workspace.CurrentCamera.CFrame.LookVector * flySpeed

end


end


end)





-- JUMP

local jump=false
local jumpPower=50


jumpBtn.MouseButton1Click:Connect(function()


jump=not jump


jumpBtn.Text=jump and "Jump ON" or "Jump OFF"


local hum=player.Character:FindFirstChildOfClass("Humanoid")


if hum then

hum.JumpPower=jump and jumpPower or 50

end


end)



jumpPowerBtn.MouseButton1Click:Connect(function()


jumpPower=jumpPower+50


if jumpPower>500 then
jumpPower=50
end


jumpPowerBtn.Text="Jump: "..jumpPower


local hum=player.Character:FindFirstChildOfClass("Humanoid")


if hum and jump then
hum.JumpPower=jumpPower
end


end)





-- NOCLIP

local noclip=false


noclipBtn.MouseButton1Click:Connect(function()


noclip=not noclip


noclipBtn.Text=noclip and "Noclip ON" or "Noclip OFF"


end)



RunService.Stepped:Connect(function()


if noclip and player.Character then


for _,v in pairs(player.Character:GetDescendants()) do


if v:IsA("BasePart") then

v.CanCollide=false

end


end


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
-- ANTI AFK

player.Idled:Connect(function()

VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())

end)
