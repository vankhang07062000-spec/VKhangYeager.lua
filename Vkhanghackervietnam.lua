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

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "VKChatMenu"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

-------------------------------------------------
-- NÚT CHAT
-------------------------------------------------
local ChatBtn = Instance.new("TextButton")
ChatBtn.Parent = gui
ChatBtn.Size = UDim2.new(0,60,0,60)
ChatBtn.Position = UDim2.new(0,20,0.5,-30)
ChatBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
ChatBtn.Text = "💬"
ChatBtn.TextScaled = true
ChatBtn.TextColor3 = Color3.new(1,1,1)
ChatBtn.BorderSizePixel = 0

Instance.new("UICorner",ChatBtn).CornerRadius = UDim.new(1,0)

-------------------------------------------------
-- KHUNG CHAT
-------------------------------------------------
local Frame = Instance.new("Frame")
Frame.Parent = gui
Frame.Size = UDim2.new(0,360,0,240)
Frame.Position = UDim2.new(0.5,-180,0.3,0)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Visible = false
Frame.BorderSizePixel = 0

Instance.new("UICorner",Frame).CornerRadius = UDim.new(0,10)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundTransparency = 1
Title.Text = "💬 Chat Menu"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

local Messages = Instance.new("TextBox")
Messages.Parent = Frame
Messages.Size = UDim2.new(1,-20,0,140)
Messages.Position = UDim2.new(0,10,0,40)
Messages.MultiLine = true
Messages.ClearTextOnFocus = false
Messages.TextXAlignment = Enum.TextXAlignment.Left
Messages.TextYAlignment = Enum.TextYAlignment.Top
Messages.Text = ""
Messages.PlaceholderText = "Nội dung chat..."
Messages.BackgroundColor3 = Color3.fromRGB(40,40,40)
Messages.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Messages).CornerRadius = UDim.new(0,8)

local Input = Instance.new("TextBox")
Input.Parent = Frame
Input.Size = UDim2.new(0.75,-15,0,35)
Input.Position = UDim2.new(0,10,1,-45)
Input.PlaceholderText = "Nhập tin nhắn..."
Input.BackgroundColor3 = Color3.fromRGB(45,45,45)
Input.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Input).CornerRadius = UDim.new(0,8)

local Send = Instance.new("TextButton")
Send.Parent = Frame
Send.Size = UDim2.new(0.25,-15,0,35)
Send.Position = UDim2.new(0.75+0.01,0,1,-45)
Send.Text = "Gửi"
Send.BackgroundColor3 = Color3.fromRGB(0,170,255)
Send.TextColor3 = Color3.new(1,1,1)

Instance.new("UICorner",Send).CornerRadius = UDim.new(0,8)

-------------------------------------------------
-- BẬT/TẮT CHAT
-------------------------------------------------
ChatBtn.MouseButton1Click:Connect(function()
	Frame.Visible = not Frame.Visible
end)

-------------------------------------------------
-- GỬI CHAT
-------------------------------------------------
Send.MouseButton1Click:Connect(function()
	if Input.Text ~= "" then
		Messages.Text = Messages.Text .. "\nBạn: "..Input.Text
		Input.Text = ""
	end
end)

-------------------------------------------------
-- HÀM KÉO THẢ
-------------------------------------------------
local function Drag(Object)
	local dragging=false
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta=input.Position-dragStart
		Object.Position=UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset+delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset+delta.Y
		)
	end

	Object.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1
		or input.UserInputType==Enum.UserInputType.Touch then
			dragging=true
			dragStart=input.Position
			startPos=Object.Position

			input.Changed:Connect(function()
				if input.UserInputState==Enum.UserInputState.End then
					dragging=false
				end
			end)
		end
	end)

	Object.InputChanged:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseMovement
		or input.UserInputType==Enum.UserInputType.Touch then
			dragInput=input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input==dragInput and dragging then
			update(input)
		end
	end)
end

Drag(ChatBtn)
Drag(Frame)
-- ANTI AFK

player.Idled:Connect(function()

VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())

end)
