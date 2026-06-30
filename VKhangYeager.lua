-- 🇻🇳 VKhang Yeager MENU (SHORT)

local P=game.Players.LocalPlayer
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local L=game:GetService("Lighting")
local VU=game:GetService("VirtualUser")

local Speed,Jump,FlySpeed=100,100,100
local SpeedOn,JumpOn,FlyOn,NoclipOn=false,false,false,false
local BV,BG


local G=Instance.new("ScreenGui",P.PlayerGui)
G.Name="VKhang Yeager"
G.ResetOnSpawn=false


local Open=Instance.new("TextButton",G)
Open.Size=UDim2.new(0,80,0,35)
Open.Position=UDim2.new(0,15,.5,0)
Open.Text="MENU"


local Menu=Instance.new("Frame",G)
Menu.Size=UDim2.new(0,230,0,330)
Menu.Position=UDim2.new(.5,-115,.5,-165)
Menu.Visible=false
Instance.new("UICorner",Menu)


local Title=Instance.new("TextLabel",Menu)
Title.Size=UDim2.new(1,0,0,40)
Title.Text="🇻🇳 VKhang Yeager"
Title.TextScaled=true
Title.BackgroundTransparency=1


Open.MouseButton1Click:Connect(function()
	Menu.Visible=not Menu.Visible
end)


local function Btn(t,y)
	local b=Instance.new("TextButton",Menu)
	b.Size=UDim2.new(.8,0,0,30)
	b.Position=UDim2.new(.1,0,0,y)
	b.Text=t
	return b
end


local SB=Btn("⚡ SPEED OFF",50)
local JB=Btn("🦘 JUMP OFF",100)
local FB=Btn("✈ FLY OFF",150)
local NB=Btn("👻 NOCLIP OFF",200)
local FX=Btn("🚀 FIX MAP",250)


local SpeedBox=Instance.new("TextBox",Menu)
SpeedBox.Size=UDim2.new(.8,0,0,25)
SpeedBox.Position=UDim2.new(.1,0,0,290)
SpeedBox.PlaceholderText="Speed"


SpeedBox.FocusLost:Connect(function()
	local n=tonumber(SpeedBox.Text)
	if n then Speed=math.clamp(n,1,500) end
end)


SB.MouseButton1Click:Connect(function()
	SpeedOn=not SpeedOn
	SB.Text=SpeedOn and "⚡ SPEED ON" or "⚡ SPEED OFF"
end)


JB.MouseButton1Click:Connect(function()
	JumpOn=not JumpOn
	JB.Text=JumpOn and "🦘 JUMP ON" or "🦘 JUMP OFF"
end)-- FLY

local function StartFly()

	local c=P.Character or P.CharacterAdded:Wait()
	local r=c:WaitForChild("HumanoidRootPart")

	if BV then BV:Destroy() end
	if BG then BG:Destroy() end

	BV=Instance.new("BodyVelocity")
	BV.MaxForce=Vector3.new(1e9,1e9,1e9)
	BV.Parent=r

	BG=Instance.new("BodyGyro")
	BG.MaxTorque=Vector3.new(1e9,1e9,1e9)
	BG.Parent=r

end


local function StopFly()

	if BV then
		BV:Destroy()
		BV=nil
	end

	if BG then
		BG:Destroy()
		BG=nil
	end

end



FB.MouseButton1Click:Connect(function()

	FlyOn=not FlyOn

	FB.Text=
	FlyOn and "✈ FLY ON"
	or "✈ FLY OFF"


	if FlyOn then
		StartFly()
	else
		StopFly()
	end

end)



RS.RenderStepped:Connect(function()

	if FlyOn and BV and BG then

		local cam=workspace.CurrentCamera

		BG.CFrame=cam.CFrame

		BV.Velocity=
		cam.CFrame.LookVector*FlySpeed

	end

end)



-- NOCLIP

NB.MouseButton1Click:Connect(function()

	NoclipOn=not NoclipOn

	NB.Text=
	NoclipOn and "👻 NOCLIP ON"
	or "👻 NOCLIP OFF"

end)



-- MAIN

RS.Stepped:Connect(function()

	local c=P.Character

	if c then

		local h=c:FindFirstChildOfClass("Humanoid")

		if h then

			if SpeedOn then
				h.WalkSpeed=Speed
			end

			if JumpOn then
				h.UseJumpPower=true
				h.JumpPower=Jump
			end

		end


		if NoclipOn then

			for _,v in pairs(c:GetDescendants()) do

				if v:IsA("BasePart") then
					v.CanCollide=false
				end

			end

		end

	end

end)



-- FIX MAP

FX.MouseButton1Click:Connect(function()

	L.Brightness=3
	L.GlobalShadows=false
	L.FogEnd=1000000

	FX.Text="🚀 DONE"

end)



-- RESPAWN FIX FLY

P.CharacterAdded:Connect(function()

	task.wait(1)

	if FlyOn then
		StartFly()
	end

end)



-- ANTI AFK

P.Idled:Connect(function()

	VU:CaptureController()

	VU:ClickButton2(Vector2.new())

end)



print("🇻🇳 VKhang Yeager Loaded")
