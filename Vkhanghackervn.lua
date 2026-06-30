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
menu.Size=UDim2.new(0,230,0,310)
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

lagBtn.MouseButton1Click:Connect(function()


Lighting.Brightness=5
Lighting.ClockTime=14
Lighting.GlobalShadows=false
Lighting.FogStart=0
Lighting.FogEnd=100000
Lighting.Ambient=Color3.new(1,1,1)
Lighting.OutdoorAmbient=Color3.new(1,1,1)



pcall(function()

settings().Rendering.QualityLevel =
Enum.QualityLevel.Level01

end)



for _,v in pairs(workspace:GetDescendants()) do


if v:IsA("ParticleEmitter")
or v:IsA("Trail")
or v:IsA("Smoke")
or v:IsA("Fire")
or v:IsA("Sparkles")
or v:IsA("Explosion") then


v:Destroy()


end



if v:IsA("BasePart") then

v.Material=Enum.Material.Plastic

end


end


end)





-- ANTI AFK

player.Idled:Connect(function()

VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())

end)
