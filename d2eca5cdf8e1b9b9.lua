local sound = Instance.new("Sound", game.Workspace)
sound.SoundId = "rbxassetid://8819783960"
sound.Volume = 1
if not sound.IsLoaded then
	sound.Loaded:wait()
end

local sound1 = Instance.new("Sound", game.Workspace)
sound1.SoundId = "rbxassetid://8819782435"
sound1.Volume = 1
if not sound1.IsLoaded then
	sound1.Loaded:wait()
end
local placemarker = Instance.new("Part", game.Workspace)
placemarker.Anchored = true
placemarker.CanCollide = false
placemarker.Size = Vector3.new(1.5, 1.5, 1.5)
placemarker.Transparency = 0.1
placemarker.Material = "Neon"
placemarker.Color = Color3.fromRGB(255, 0, 0)
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Runserv = game:GetService("RunService")

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(82, 14, 199)
circle.Thickness = 0
circle.NumSides = 732
circle.Radius = 120
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = false
circle.Filled = false

Runserv.RenderStepped:Connect(function()
    circle.Position = Vector2.new(mouse.X,mouse.Y+35)
end)
local autopeekmarker = Instance.new("Part", game.Workspace)
autopeekmarker.Anchored = true
autopeekmarker.CanCollide = false
autopeekmarker.Size = Vector3.new(0.5, 0.5, 0.5)
getgenv().SilentAimbotKey = 'b';  getgenv().WEBHOOK_URL = 'https://discord.com/api/webhooks/972726145789358111/EgqKG0a9yCKWzOberx70i0SARbbNB1FR8b48YPjatKtuxn-ADvvRHH7eTBEkgk9geqGt';
      
local Stuff = {
    Blatant = {
		Speed = {
			Enabled = false, -- true , false
			WallCheck = true, -- true , false
			AutoJump = false, -- true , false
			AlwaysJump = false, -- true , false
			JumpHeight = 50, -- any digit
			Movement = "MoveDirection", -- MoveDirection , Manual
			Mode = "CFrame", -- Velocity , CFrame , TP
			Speed = 150, -- any digit (for tp its amount of studs tped)
			TPModeDelay = 5, -- delay between tps for tp mode
		
		
		}
    }
}

-- functions for checking players, renderstepped etc
local humanoid = game.Players.LocalPlayer.Character.Humanoid
local players = game:GetService("Players")
local textservice = game:GetService("TextService")
local lplr = players.LocalPlayer
local workspace = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local uis = game:GetService("UserInputService")
local function runcode(func)
	func()
end
local RenderStepTable = {}
local StepTable = {}
local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end
local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end
local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

-- idk what to call this but table enable thingys

	local speedval = {["Value"] = 1}
	local speedmethod = {["Value"] = "AntiCheat A"}
	local speedmovemethod = {["Value"] = "MoveDirection"}
	local speeddelay = {["Value"] = 0.7}
	local speedwallcheck = {["Enabled"] = true}
	local speedjump = {["Enabled"] = false}
	local speedjumpheight = {["Value"] = 20}
	local speedjumpalways = {["Enabled"] = false}
	local speedup
	local speeddown
	local w = 0
	local s = 0
	local a = 0
	local d = 0
	local bodyvelo
	local speeddelayval = tick() 
	game:GetService("RunService").Stepped:connect(function()
			if Stuff.Blatant.Speed.Enabled == true then
				speeddown = game:GetService("UserInputService").InputBegan:connect(function(input1)
					if game:GetService("UserInputService"):GetFocusedTextBox() == nil then
						if input1.KeyCode == Enum.KeyCode.W then
							w = true
						end
						if input1.KeyCode == Enum.KeyCode.S then
							s = true
						end
						if input1.KeyCode == Enum.KeyCode.A then
							a = true
						end
						if input1.KeyCode == Enum.KeyCode.D then
							d = true
						end
					end
				end)
				speedup = game:GetService("UserInputService").InputEnded:connect(function(input1)
					if input1.KeyCode == Enum.KeyCode.W then
						w = false
					end
					if input1.KeyCode == Enum.KeyCode.S then
						s = false
					end
					if input1.KeyCode == Enum.KeyCode.A then
						a = false
					end
					if input1.KeyCode == Enum.KeyCode.D then
						d = false
					end
				end)
				BindToStepped("Speed", 1, function(time, delta)
					if isAlive then
						local jumpcheck = killauranear and Killaura["Enabled"]
						local movevec = (Stuff.Blatant.Speed.Movement == "Manual" and (not (w or s or a or d)) and Vector3.new(0, 0, 0) or lplr.Character.Humanoid.MoveDirection).Unit
						movevec = movevec == movevec and movevec or Vector3.new(0, 0, 0)
						if Stuff.Blatant.Speed.Mode == "Velocity" then
							local newvelo = movevec * Stuff.Blatant.Speed.Speed
							lplr.Character.HumanoidRootPart.Velocity = Vector3.new(newvelo.X, lplr.Character.HumanoidRootPart.Velocity.Y, newvelo.Z)
						elseif Stuff.Blatant.Speed.Mode == "CFrame" then
							local newpos = (movevec * (math.clamp(Stuff.Blatant.Speed.Speed - lplr.Character.Humanoid.WalkSpeed, 0, 1000000000) * delta))
							if Stuff.Blatant.Speed.WallCheck == true then
								local raycastparameters = RaycastParams.new()
								raycastparameters.FilterDescendantsInstances = {lplr.Character}
								local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
								if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
							end
							lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
						elseif Stuff.Blatant.Speed.Mode == "TP" then
							if speeddelayval <= tick() then
								speeddelayval = tick() + (Stuff.Blatant.Speed.TPModeDelay / 10)
								local newpos = (movevec * (math.clamp(Stuff.Blatant.Speed.Speed - lplr.Character.Humanoid.WalkSpeed, 0, 1000000000)))
								if Stuff.Blatant.Speed.WallCheck == true then
									local raycastparameters = RaycastParams.new()
									raycastparameters.FilterDescendantsInstances = {lplr.Character}
									local ray = workspace:Raycast(lplr.Character.HumanoidRootPart.Position, newpos, raycastparameters)
									if ray then newpos = (ray.Position - lplr.Character.HumanoidRootPart.Position) end
								end
								lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame + newpos
							end
						end
						if Stuff.Blatant.Speed.AutoJump == true and (Stuff.Blatant.Speed.AlwaysJump == true or jumpcheck) then
							if (lplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air) and lplr.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
								lplr.Character.HumanoidRootPart.Velocity = Vector3.new(lplr.Character.HumanoidRootPart.Velocity.X, Stuff.Blatant.Speed.JumpHeight, lplr.Character.HumanoidRootPart.Velocity.Z)
							end
						end
					end
				end)
			else
				speeddelayval = 0
				if speedup then
					speedup:Disconnect()
				end
				if speeddown then
					speeddown:Disconnect()
				end
				if bodyvelo then
					bodyvelo:Remove()
				end
				UnbindFromStepped("Speed")
			end
	end)
getgenv().espcolors = {
boxcolor = Color3.fromRGB(255,255,255),
healthcolor = Color3.fromRGB(0,255,0),
namecolor = Color3.fromRGB(255,255,255),
toolcolor = Color3.fromRGB(255,255,255),
outlinecolor = Color3.fromRGB(0,0,0),
crosshaircolor = Color3.fromRGB(255,255,255),
distance = 120,
textsize = 13
}
getgenv().boxes = false
getgenv().weapon = false
getgenv().health = false
getgenv().healthnumber = false
getgenv().displaynames = false
getgenv().ZyZKey = Enum.KeyCode.Q
getgenv().Prediction = 7
getgenv().Tracer = false
getgenv().TracerBugged = false
getgenv().LookAt = false
getgenv().ZyZPart = "LowerTorso"
getgenv().NotifyZyZ = false
getgenv().BlindStrafe = false
getgenv().RainbowFov = false
getgenv().ViewPlr = false
getgenv().Enabled = false
getgenv().Webhookmode = false
getgenv().Notifysound = false
getgenv().TracerRainbow = false
getgenv().PartMode = false
getgenv().antistomp = false
getgenv().PartModePred = false
getgenv().UseType = 'Silent'
getgenv().KnockedCheck = false
getgenv().GRABCheck = false
getgenv().TargetStrafe = false
getgenv().AutoPeek = false
getgenv().nightmode = false

local MapLightingJmp = Instance.new("ColorCorrectionEffect")
MapLightingJmp.Parent = game:GetService("Lighting")
MapLightingJmp.Enabled = false
MapLightingJmp.Brightness = 0
MapLightingJmp.Contrast = 0
MapLightingJmp.Saturation = 0
MapLightingJmp.TintColor = Color3.fromRGB(255, 255, 255)
local i = 0
_G.Targetdis = 5
_G.Targetspeed = 0.4
_G.AirshotFunction = false
_G.AirshotPart = "LowerTorso"
_G.FRAME = Vector3.new(0,20,0)
getgenv().smooth = false
getgenv().smootham = 1
spawn(function()
repeat
wait()
i = i + 0.00001
until getgenv().TargetStrafe == nil
end)

local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService("Workspace").CurrentCamera
local LocalMouse = game.Players.LocalPlayer:GetMouse()
local Locking = false
local cc = game:GetService("Workspace").CurrentCamera
local gs = game:GetService("GuiService")
local ggi = gs.GetGuiInset
local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

local Tracer = Drawing.new("Line")
Tracer.Visible = false
Tracer.Color = Color3.fromRGB(82, 14, 199)
Tracer.Thickness = 1
Tracer.Transparency = 1

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(
    function(keygo, ok)
        if (not ok) then
            if (keygo.KeyCode == getgenv().ZyZKey) then
                if getgenv().Enabled then
                    Locking = not Locking
                    if Locking then
                        Plr = getClosestPlayerToCursor()
                        if getgenv().ViewPlr then
                        	game.Workspace.CurrentCamera.CameraSubject = Plr.Character
                            
                        end
                        if getgenv().Webhookmode == true then 

                            sendMessage("Locked Onto"..Plr.DisplayName.." ")
            
                        end
                        if getgenv().Notifysound then
                            sound:Play()
                        end
if getgenv().TracerRainbow == true then
                    spawn(function()
                    for i = 0, 1, 0.001 do
                        Tracer.Color = Color3.fromHSV(i, 1, 1)
                        task.wait()
                    end
                    end)
end

if getgenv().RainbowFov == true then
                        spawn(function()
                    for i = 0, 1, 0.001 do
                        circle.Color = Color3.fromHSV(i, 1, 1)
                        task.wait()
                    end
                    end)
end


    
                        if getgenv().NotifyZyZ then
game.StarterGui:SetCore("SendNotification", {
    Title = "NEOWARE | .gg/ateneo";
    Text = "Locked onto " .. Plr.Character.Humanoid.DisplayName;
    Duration = 2;
    Callback = NotificationBindable;
})
                        end
                        
                    elseif not Locking then
                      
if getgenv().ViewPlr then
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
end

if getgenv().Notifysound then
    sound1:Play()
end

if getgenv().Webhookmode == true then 

    sendMessage("unlocked")

end
                        if getgenv().NotifyZyZ then
game.StarterGui:SetCore("SendNotification", {
    Title = "NEOWARE";
    Text = "unlocked";
    Duration = 2;
    Callback = NotificationBindable;
})                        end
                    end
                end
            end
        end
    end
)
function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = 137

                
    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild("LowerTorso")
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
         end
    end
    return closestPlayer
end

local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if getgenv().Enabled and Locking and not getgenv().UseType == 'Camera' and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] =
                Plr.Character[getgenv().ZyZPart].Position + (Plr.Character[getgenv().ZyZPart].Velocity / Prediction)
            return old(unpack(args))
        end
        return old(...)
    end
)

game:GetService("RunService").RenderStepped:Connect(
    function()
           
        if _G.AirshotFunction == true then
            if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().ZyZPart = _G.AirshotPart
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(
                    function(old, new)
                        if new == Enum.HumanoidStateType.Freefall then
                            getgenv().ZyZPart = _G.AirshotPart
                        else
                            getgenv().ZyZPart = "LowerTorso"
                        end
                    end
                )
            end
        end
if getgenv().BlindStrafe and Locking and getgenv().Enabled then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position + _G.FRAME)
end
if getgenv().PartMode and Locking and getgenv().Enabled and not getgenv().PartModePred then
       placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position)
end
   if getgenv().PartMode and not Locking and getgenv().Enabled and not getgenv().PartModePred then
            placemarker.CFrame = CFrame.new(0, 9999, 0)
end
if getgenv().PartMode and getgenv().PartModePred  and Locking and getgenv().Enabled then
       placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position + (Plr.Character.HumanoidRootPart.Velocity / Prediction))
end
    if getgenv().PartMode and getgenv().PartModePred and not Locking and getgenv().Enabled then
            placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
if getgenv().PartMode == false then
    placemarker.CFrame = CFrame.new(0, 9999, 0)
end
if getgenv().antistomp then
    if 6 > game.Players.LocalPlayer.Character.Humanoid.Health then
        for L_170_forvar0, L_171_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if L_171_forvar1:IsA("BasePart") then
            L_171_forvar1:Destroy()
        end
        end
end
end
if getgenv().nightmode == true then
    game:GetService("Lighting").ColorCorrection.Brightness = -0.1
else
    game:GetService("Lighting").ColorCorrection.Brightness = 0
end
if getgenv().BlindStrafe and Locking and getgenv().Enabled then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position + _G.FRAME)
end


if getgenv().LookAt and Locking and getgenv().Enabled then
                    local Char = game.Players.LocalPlayer.Character
                local PrimaryPartOfChar = game.Players.LocalPlayer.Character.PrimaryPart
                local NearestChar = Plr.Character
                local NearestRoot = Plr.Character.HumanoidRootPart
                local NearestPos = CFrame.new(PrimaryPartOfChar.Position, Vector3.new(NearestRoot.Position.X, NearestRoot.Position.Y, NearestRoot.Position.Z))
                Char:SetPrimaryPartCFrame(NearestPos)
                
    end
        if getgenv().Tracer == true and Locking then
            local Vector, OnScreen =
                cc:worldToViewportPoint(
                Plr.Character[getgenv().ZyZPart].Position + (Plr.Character[getgenv().ZyZPart].Velocity / Prediction)
            )
            Tracer.Visible = true
            Tracer.From = Vector2.new(mouse.X, mouse.Y + ggi(gs).Y)
            Tracer.To = Vector2.new(Vector.X, Vector.Y)
        elseif getgenv().Tracer == false then
            Tracer.Visible = false
        end
if Tracer.Visible == true and not Locking and getgenv().Enabled then
    getgenv().TracerBugged = true
    Tracer.Visible = false
end

if getgenv().Tracer == true and getgenv().TracerBugged and Locking then
    Tracer.Visible = true
end
end)

game:GetService("RunService").RenderStepped:Connect(
function()
    if getgenv().UseType == 'Camera' and not getgenv().smooth and Locking and getgenv().Enabled then
        workspace.CurrentCamera.CFrame = CFrame.new(
            workspace.CurrentCamera.CFrame.Position,
            Plr.Character[getgenv().ZyZPart].Position +
            Plr.Character[getgenv().ZyZPart].Velocity / getgenv().Prediction
        )

    end
    local main = CFrame.new(
            workspace.CurrentCamera.CFrame.Position,
            Plr.Character[getgenv().ZyZPart].Position +
            Plr.Character[getgenv().ZyZPart].Velocity / getgenv().Prediction
        )
    if getgenv().UseType == 'Camera' and getgenv().smooth and Locking and getgenv().Enabled then
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(main,
    getgenv().smootham,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.InOut
    )
    end

end)

game:GetService("RunService").Heartbeat:Connect(
function()
if getgenv().GRABCheck == true then
if getgenv().Enabled  and Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") then
Locking = false
end
end
if getgenv().KnockedCheck == true then
if getgenv().Enabled and  Plr:FindFirstChild("BodyEffects"):FindFirstChild("K.O").Value == true or Plr:FindFirstChild("BodyEffects"):FindFirstChild("Dead").Value == true then
Locking = false
end

end
if getgenv().TargetStrafe and Locking and getgenv().Enabled then
    local incline = math.rad(0)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plr.Character.HumanoidRootPart.CFrame * CFrame.fromEulerAnglesXYZ(incline, i * _G.Targetspeed, 0) * CFrame.new(0, 0, _G.Targetdis)
    end
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/turbostain/gavnozalupa/main/hi"))()
Library.theme.accentcolor = Color3.fromRGB(82,14,199)
Library.theme.accentcolor2 = Color3.fromRGB(82,14,199)
local Window = Library:CreateWindow("Fatality", Vector2.new(500, 540), Enum.KeyCode.RightShift)
local Tab = Window:CreateTab("Aiming")
local Rage = Window:CreateTab("Rage")
local Vistab = Window:CreateTab("Visuals")
local vissec = Vistab:CreateSector("Lighting","right")
local EspSection = Vistab:CreateSector("Esp", "left")
local SETS = Window:CreateTab("Settings")
SETS:CreateConfigSystem("left")
local TargetSection = Tab:CreateSector("Target", "left")
local Speedtt = Rage:CreateSector("Speed", "left")
local targetssec = Rage:CreateSector("Target Strafe","left")
local autopeeksec = Rage:CreateSector("Auto Peek", "left")
local ragesec = Rage:CreateSector("Misc","left")
local antisesec = Rage:CreateSector("Toggles", "right")
local teleportsec = Rage:CreateSector("Teleport", "right")
local autobuyssec = Rage:CreateSector("Auto Buys","right")
local Fovsection = Tab:CreateSector("Fov","right")
local Vissec = Tab:CreateSector("Visualization","right")
local Tracersec = Tab:CreateSector("Tracer","right")


local targettoggle = TargetSection:AddToggle('Enabled',false, function(Boolean)
	getgenv().Enabled = Boolean
end)
TargetSection:AddKeybind("Bind", Enum.KeyCode.Q, function(hi)
getgenv().ZyZKey = hi
end)
TargetSection:AddDropdown("Hitbox",  {
	"Head",
	"UpperTorso",
	"HumanoidRootPart",
	"LowerTorso"
}, "HumanoidRootPart", false, function(state)
	getgenv().ZyZPart = state
end)

TargetSection:AddSlider("Prediction", 0, 7, 12, 10, function(sus)
	getgenv().Prediction = sus
end)

TargetSection:AddToggle('Knocked Check', false, function(Boolean)
	getgenv().KnockedCheck = Boolean
end)
TargetSection:AddToggle('Grabbed Check', false, function(Boolean)
	getgenv().GRABCheck = Boolean
end)

TargetSection:AddDropdown("Mode",  {
	"Camera",
	"Silent"
}, "Silent", false, function(state)
	getgenv().UseType = state
end)
TargetSection:AddToggle('Smoothness', false, function(Boolean)
	getgenv().smooth = Boolean
end)
TargetSection:AddSlider("Smoothness Amount", 0, 0.1, 1, 100, function(sus)
	getgenv().smootham = sus
end)
TargetSection:AddToggle('Notification Mode', false, function(Boolean)
	getgenv().NotifyZyZ = Boolean
end)
TargetSection:AddToggle('Sound Mode', false, function(Boolean)
	getgenv().Notifysound = Boolean
end)
TargetSection:AddSlider("Sound Volume", 0, 0.5, 1, 10, function(sus)
	sound.Volume = sus
	sound1.Volume = sus
end)
TargetSection:AddToggle('Airshot Function',false,function(state)
    _G.AirshotFunction = state
end)
TargetSection:AddDropdown("Airshot Hitbox",  {
	"Head",
	"UpperTorso",
	"HumanoidRootPart",
	"LowerTorso",
	"LeftUpperLeg",
	"LeftFoot"
}, "HumanoidRootPart", false, function(state)
	_G.AirshotPart = state
end)
Tracersec:AddToggle('Show Tracer', false, function(Boolean)
	getgenv().Tracer = Boolean
end)


Tracersec:AddSlider("Transparency", 0, 1, 1, 10, function(sus)
	Tracer.Transparency = sus
end)
Tracersec:AddSlider("Thickness", 0, 1, 1, 10, function(sus)
	Tracer.Transparency = sus
end)
Tracersec:AddColorpicker("Color",Color3.fromRGB(82,14,199), function(Color)
    Tracer.Color = Color
end)
Tracersec:AddToggle('Rainbow Tracer', false, function(Boolean)
	getgenv().TracerRainbow = Boolean
end)
local lookattoggle = TargetSection:AddToggle('Look At', false, function(Boolean)
	getgenv().LookAt = Boolean
end)
lookattoggle:AddKeybind()
local viewtoggle = TargetSection:AddToggle('View Target',false,function(state)
    getgenv().ViewPlr = state
end)
viewtoggle:AddKeybind()
local blindtoggle = TargetSection:AddToggle('Air Strafe',false,function(state)
    getgenv().BlindStrafe = state
end)
TargetSection:AddSlider("Air Strafe Distance", 0, 20, 100, 1, function(sus)
	_G.FRAME = Vector3.new(0,sus,0) 
end)

targetssec:AddToggle('Target Strafe', false, function(Boolean)
	getgenv().TargetStrafe = Boolean
end)

targetssec:AddSlider("TS Speed", 0, 0, 100, 1, function(sus)
_G.Targetspeed = sus * 400
end)
targetssec:AddSlider("TS Distance", 0, 5, 20, 1, function(sus)
	_G.Targetdis = sus
end)

Vissec:AddToggle('Part Mode',false,function(state)
    getgenv().PartMode = state
end)
Vissec:AddToggle('Prediction On Part',false,function(state)
    getgenv().PartModePred = state
end)

Vissec:AddDropdown("Part Type",  {
	"Aimpart",
	"Box",
	"Ball"
}, "Aimpart", false, function(state)
if state == "Aimpart" then
placemarker.Size = Vector3.new(1.5, 1.5, 1.5)
placemarker.Transparency = 0.1
placemarker.Color = Color3.fromRGB(255, 0, 0)
placemarker.Material = "Neon" 
placemarker.Shape = Enum.PartType.Block
placemarker.Changed()
elseif state == "Box" then
placemarker.Size = Vector3.new(10, 7, 10)
placemarker.Transparency = 0.75
placemarker.Material = "Plastic" 
placemarker.Color = Color3.fromRGB(255, 255, 255, 0.20, 0)
placemarker.Shape = Enum.PartType.Block
placemarker.Changed()
elseif state == "Ball" then
placemarker.Size = Vector3.new(1, 1, 1)
placemarker.Transparency = 0
placemarker.Material = "Plastic" 
placemarker.Color = Color3.fromRGB(255,0,0)
placemarker.Shape = Enum.PartType.Ball
placemarker.Changed()
end
end)
Vissec:AddDropdown("Part Material",  {
	"ForceField",
	"Glass",
	"Neon",
	"Plastic",
	"Wood"
}, "Neon", false, function(state)
placemarker.Material = state
placemarker.Changed()
end)
Fovsection:AddToggle('Show Fov',false,function(state)
    circle.Visible = state
end)
Fovsection:AddSlider("Fov Size", 0, 75, 500, 1, function(sus)
	circle.Radius = sus
end)
Fovsection:AddColorpicker("Fov Color",Color3.fromRGB(255, 255, 255), function(Color)
    circle.Color = Color
end)
Fovsection:AddToggle('Rainbow Fov',false,function(state)
    getgenv().RainbowFov = state
end)

vissec:AddToggle('Color Correction',false, function(state)
    MapLightingJmp.Enabled = state
end)
vissec:AddSlider("Brightness", 0, 0, 1, 100, function(value)
    MapLightingJmp.Brightness = value
end)
vissec:AddSlider("Contrast", 0, 0, 1, 100, function(value)
    MapLightingJmp.Contrast = value
end)
vissec:AddSlider("Saturation", 0, 0, 2, 100, function(value)
    MapLightingJmp.Saturation = value
end)

vissec:AddColorpicker("World Accent",Color3.fromRGB(255, 255, 255), function(Color)
    MapLightingJmp.TintColor = Color
end)
vissec:AddToggle('Nightmode',false, function(state)
    getgenv().nightmode = state
end)
local boxtoggle = EspSection:AddToggle('Boxes', false, function(nigger)
getgenv().boxes = nigger
end)
boxtoggle:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
    getgenv().espcolors.boxcolor = Color
end)
local nametoggle = EspSection:AddToggle('Dispay Names', false, function(nigger)
getgenv().displaynames = nigger
end)
nametoggle:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
    getgenv().espcolors.namecolor = Color
   
end)
local healthtoggle = EspSection:AddToggle('Health Bars', false, function(nigger)
getgenv().health = nigger
end)
EspSection:AddToggle('Health Numbers', false, function(nigger)
getgenv().healthnumber = nigger
end)
healthtoggle:AddColorpicker(Color3.fromRGB(0, 255, 0), function(Color)
    getgenv().espcolors.healthcolor = Color
end)
healthtoggle:AddColorpicker(Color3.fromRGB(0, 0, 0), function(Color)
    getgenv().espcolors.outlinecolor = Color
end)
local weapontoggle = EspSection:AddToggle('Weapons', false, function(nigger)
 getgenv().weapon = nigger
end)
weapontoggle:AddColorpicker(Color3.fromRGB(255, 255, 255), function(Color)
     getgenv().espcolors.toolcolor = Color
end)
EspSection:AddSlider("Distance", 0, 100, 1500, 1, function(xyz)
	getgenv().espcolors.distance = xyz
end)
EspSection:AddSlider("Font Size", 1, 13, 30, 1, function(xyz)
	getgenv().espcolors.textsize = xyz
end)
local speedtoggle = Speedtt:AddToggle('Speed',false, function(state)
    Stuff.Blatant.Speed.Enabled = state
end)
speedtoggle:AddKeybind()
Speedtt:AddSlider("Speed Amount", 0, 100, 500, 1, function(value)
    Stuff.Blatant.Speed.Speed = value
end)

Speedtt:AddDropdown("Type",  {
"CFrame", "Velocity", "TP"
}, "CFrame", false, function(value)
    Stuff.Blatant.Speed.Mode = value
end)

Speedtt:AddDropdown("Movement",  {
"MoveDirection",
"Manual"
}, "Manual", false, function(value)
    Stuff.Blatant.Speed.Movement = value
end)
autopeeksec:AddToggle("Auto Peek Enabled", false, function(suck)
getgenv().AutoPeek = suck
if suck then
    autopeekmarker.Transparency = 0.3
else 
    autopeekmarker.Transparency = 1
end
        plr = game:GetService('Players').LocalPlayer
	X1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.X
	Y1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Y
	Z1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Z
      autopeekmarker.CFrame = CFrame.new(X1,Y1,Z1) 
end)

autopeeksec:AddKeybind("Save Key", false, function()
    
end, function()
    if getgenv().AutoPeek then
        plr = game:GetService('Players').LocalPlayer
	X1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.X
	Y1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Y
	Z1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Z
      autopeekmarker.CFrame = CFrame.new(X1,Y1,Z1) 
 end
end)
autopeeksec:AddKeybind("Load Key", false, function()
    
end, function()
    if getgenv().AutoPeek then
        plr = game:GetService('Players').LocalPlayer
	plr.Character.HumanoidRootPart.CFrame = CFrame.new(X1,Y1,Z1)
    end
end)
ragesec:AddButton('Hitbox Breaker', function()
	game.Players.LocalPlayer.Character.Head:BreakJoints()
	game.Players.LocalPlayer.Character.Head.Position = Vector3.new(0, 999999999999, 0)
	game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
	game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
	game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
end)
ragesec:AddButton('God Block', function()	
pcall(function()
    game.Players.LocalPlayer.Character.BodyEffects.Defense.CurrentTimeBlock:Destroy()
end)
end)
antisesec:AddToggle("Anti Stomp",false,function(asd)
    getgenv().antistomp = asd
    end)


teleportsec:AddDropdown("Location",  {"None","Guns Admin Base", "High Medium Armor", "Uphill Mountain", "Playground Mountain", "Bank Buildings", "Rev Mountain", "Casino Mountain", "Flank Mountain"}, "None", false, function(State)
if State == "Guns Admin Base" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-874.903992, -32.6492004, -525.215698)
elseif State == "High Medium Armor" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-934.73651123047, -28.492471694946, 565.99884033203)
elseif State == "Food" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-788.39318847656, -39.649200439453, -935.27795410156)
elseif State == "Uphill Mountain" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(485.651947, 112.5, -644.316833, -0.998899043, 1.33881997e-06, 0.0469136797, 8.00526664e-07, 1, -1.14929126e-05, -0.0469136797, -1.14426994e-05, -0.998899043)
elseif State == "AK Mountain" then

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-658.31897, 80.9998474, -778.077576, -0.142138869, 1.05273443e-08, -0.989845812, 4.51260629e-09, 1, 9.98731764e-09, 0.989845812, -3.04721426e-09, -0.142138869)
elseif State == "Playground Mountain" then

	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260.836182, 126.424866, -877.783875, -0.977067351, -1.56508904e-05, -0.212922528, 9.92513264e-07, 1, -7.80593255e-05, 0.212922528, -7.64806027e-05, -0.977067351)
elseif State == "Bank Buildings" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-327.583862, 80.4338913, -278.811951, -0.0466220938, -1.94237373e-08, 0.998912573, 1.07243459e-07, 1, 2.44502392e-08, -0.998912573, 1.08266761e-07, -0.0466220938)
elseif State == "Rev Mountain" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-659.053162, 110.748001, -158.224365, 0.146754071, -2.38941595e-08, -0.989172995, -1.60316838e-09, 1, -2.43935396e-08, 0.989172995, 5.16566212e-09, 0.146754071)
elseif State == "Casino Mountain" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1048.95093, 110.254997, -154.554016, 0.198458344, 0.0412604436, -0.979240835, -4.06676299e-05, 0.999113858, 0.0420895219, 0.98010987, -0.00831318926, 0.198284075)
elseif State == "Flank Mountain" then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(376.730621, 130.748001, -245.620468, 0.996583343, 5.90310174e-06, -0.0825867951, -1.72590728e-06, 1, 5.06508768e-05, 0.0825867951, -5.03353003e-05, 0.996583343)
	end
end)  
autobuyssec:AddDropdown("Weapon",  { "None","Revolver", "Double Barrel", "SMG", "AK-47", "LMG", "Glock", "Silencer", "RPG", "Flamethrower", "Taser"
	
}, "None", false, function(State)
if State == "Revolver" then
            plr = game:GetService "Players".LocalPlayer
            local gunName = "[Revolver] - $1300"
            local k = game.Workspace.Ignored.Shop[gunName]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Double Barrel" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "SMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[SMG] - $750"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "AK-47" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[AK47] - $2250"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "LMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[LMG] - $3750"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Glock" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Glock] - $500"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Silencer" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Silencer] - $550"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "RPG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[RPG] - $6000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Flamethrower" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Flamethrower] - $25000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Taser" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Taser] - $1250"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taser] - $1250"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taser] - $1250"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
    end)
autobuyssec:AddDropdown("Ammo",  {"None","Revolver", "Double Barrel", "SMG", "AK-47", "LMG", "Glock", "Silencer", "RPG", "Flamethrower"
}, "None", false, function(State)
if State == "Revolver" then
            local plr = game:GetService "Players".LocalPlayer
            local gunName = "12 [Revolver Ammo] - $75"
            local k = game.Workspace.Ignored.Shop[gunName]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Double Barrel" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "SMG" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "AK-47" then
            plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "LMG" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Glock" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Silencer" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "RPG" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Flamethrower" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
end)
autobuyssec:AddDropdown("Food", {"None","Chicken", "Pizza", "Hotdog", "Taco", "Hamburger", "Donut", "Lettuce"}, "None", false, function(State)
 if State == "Chicken" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Chicken] - $7"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Pizza" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Pizza] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Hotdog" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[HotDog] - $8"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[HotDog] - $8"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[HotDog] - $8"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Taco" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Taco] - $2"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Hamburger" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Hamburger] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Donut" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Donut] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        elseif State == "Lettuce" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Lettuce] - $5"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lettuce] - $5"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Lettuce] - $5"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        end
end)
autobuyssec:AddDropdown("Mask", {"None","Surgeon"}, "None", false, function(State)
      if State == "Surgeon" then
            local plr = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
            local savedsilencerpos = plr.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)

            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
      end
        end)
autobuyssec:AddLabel("Note:If u want to save confi")
autobuyssec:AddLabel("g please make all autobuys a")
autobuyssec:AddLabel("nd teleport dropdown to none")

repeat
    wait()
until game:IsLoaded()
local gm = getrawmetatable(game)
setreadonly(gm, false)
local namecall = gm.__namecall
gm.__namecall =
    newcclosure(
    function(self, ...)
        local args = {...}
        if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "MainEvent" then
            if tostring(getcallingscript()) ~= "Framework" then
                return
            end
        end
        if not checkcaller() and getnamecallmethod() == "Kick" then
            return
        end
        return namecall(self, unpack(args))
     end
)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local PlayerDrawings = {}
local Utility = {}

Utility.Settings = {
Line = {
Thickness = 1,
Color = Color3.fromRGB(0, 255, 0)
},
Text = {
Size = 13,
Center = true,
Outline = true,
Font = Drawing.Fonts.Plex,
Color = Color3.fromRGB(255, 255, 255)
},
Square = {
Thickness = 1,
Color = Color3.fromRGB(255, 255, 255),
Filled = false,
},
Triangle = {
Color = Color3.fromRGB(255, 255, 255),
Filled = true,
Visible = false,
Thickness = 1,
}
}
function Utility.New(Type, Outline, Name)
local drawing = Drawing.new(Type)
for i, v in pairs(Utility.Settings[Type]) do
drawing[i] = v
end
if Outline then
drawing.Color = Color3.new(0,0,0)
drawing.Thickness = 3
end
return drawing
end
function Utility.Add(Player)
if not PlayerDrawings[Player] then
PlayerDrawings[Player] = {
Name = Utility.New("Text", nil, "Name"),
Distance = Utility.New("Text", nil, "Distance"),
Tool = Utility.New("Text", nil, "Tool"),
BoxOutline = Utility.New("Square", true, "BoxOutline"),
Box = Utility.New("Square", nil, "Box"),
HealthOutline = Utility.New("Line", true, "HealthOutline"),
Health = Utility.New("Line", nil, "Health")
}
end
end

for _,Player in pairs(Players:GetPlayers()) do
if Player ~= LocalPlayer then
Utility.Add(Player)
end
end
Players.PlayerAdded:Connect(Utility.Add)
Players.PlayerRemoving:Connect(function(Player)
if PlayerDrawings[Player] then
for i,v in pairs(PlayerDrawings[Player]) do
if v then
v:Remove()
end
end

PlayerDrawings[Player] = nil
end
end)

local ESPLoop = RunService:BindToRenderStep("updateESP", 205, function()
for _,Player in pairs (Players:GetPlayers()) do
local PlayerDrawing = PlayerDrawings[Player]
if not PlayerDrawing then continue end

for _,Drawing in pairs (PlayerDrawing) do
Drawing.Visible = false
end



local Character = Player.Character
local RootPart, Humanoid = Character and Character:FindFirstChild("HumanoidRootPart"), Character and Character:FindFirstChildOfClass("Humanoid")
if not Character or not RootPart or not Humanoid then continue end

local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
 if getgenv().espcolors.distance < DistanceFromCharacter then continue end
local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
if OnScreen then
local Size = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

local Name = PlayerDrawing.Name
local Tool = PlayerDrawing.Tool
local Distance = PlayerDrawing.Distance
local Box = PlayerDrawing.Box
local BoxOutline = PlayerDrawing.BoxOutline
local Health = PlayerDrawing.Health
local HealthOutline = PlayerDrawing.HealthOutline

if getgenv().boxes then
Box.Size = BoxSize
Box.Position = BoxPos
Box.Visible = true
Box.Color = getgenv().espcolors.boxcolor
BoxOutline.Size = BoxSize
BoxOutline.Position = BoxPos
BoxOutline.Visible = true
end

if getgenv().health then
Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
Health.To = Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
Health.Color = getgenv().espcolors.healthcolor
Health.Visible = true

HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
HealthOutline.Color = getgenv().espcolors.outlinecolor
HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) -1)
HealthOutline.Visible = true
end


if getgenv().displaynames then

    Name.Text = ""..Player.DisplayName..""
    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
Name.Color = getgenv().espcolors.namecolor
Name.Visible = true
Name.Size = getgenv().espcolors.textsize
    end
if getgenv().healthnumber then
    Name.Text = Name.Text .. " | " .. Humanoid.Health .." HP"
end

if getgenv().weapon then
local BottomOffset = BoxSize.Y + BoxPos.Y + 1
local Equipped = Player.Character:FindFirstChildOfClass("Tool") and Player.Character:FindFirstChildOfClass("Tool").Name or "None"
Tool.Text = ""..Equipped..""
Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
Tool.Color = getgenv().espcolors.toolcolor
Tool.Visible = true
Tool.Size = getgenv().espcolors.textsize
BottomOffset = BottomOffset + 15
end
end
end
end)
