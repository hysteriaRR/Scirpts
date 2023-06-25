getgenv().settings = {
    Length = 5,
    toggle = true
 }

local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

local function ESP(plr)
    local line = Drawing.new("Line") 
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = Color3.fromRGB(150,75,0)
    line.Thickness = 10
    line.Transparency = 1

    local circle1 = Drawing.new("Circle")
    circle1.Radius = 15
    circle1.NumSides = 1000
    circle1.Filled = true
    circle1.Color = Color3.fromRGB(150,75,0)
    circle1.Visible = true

    local circle2 = Drawing.new("Circle")
    circle2.Radius = 15
    circle2.NumSides = 1000
    circle2.Filled = true
    circle2.Color = Color3.fromRGB(150,75,0)
    circle2.Visible = true

    local tip = Drawing.new("Circle")
    tip.Radius = 15
    tip.NumSides = 1000
    tip.Filled = true
    tip.Color = Color3.fromRGB(74, 37, 0)
    tip.Visible = true

    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function() 
            if getgenv().settings.toggle and plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local headpos, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1, 0))
                local ball1 = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0.3, 1, 0))
                local ball2 = workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(-0.3, 1, 0))
                if OnScreen then 
                    local offsetCFrame = CFrame.new(0, 0, -getgenv().settings.Length)
                    local check = false
                    line.From = Vector2.new(headpos.X, headpos.Y)
                    circle1.Position = Vector2.new(ball1.X, ball1.Y)
                    circle2.Position = Vector2.new(ball2.X, ball2.Y)
                    circle1.Visible = OnScreen
                    circle2.Visible = OnScreen
                        local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude 
                        local value = math.clamp(1/distance*100, 0, 0) 
                        line.Thickness = value + 11
                        circle1.Radius = value +8
                        circle2.Radius = value + 8
                        tip.Radius = value + 8
                        local dir = plr.Character.HumanoidRootPart.CFrame:ToWorldSpace(offsetCFrame)
                        offsetCFrame = offsetCFrame * CFrame.new(0, 0, 0.1)
                        local dirpos, vis = camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
                        if vis then
                            check = true
                            line.To = Vector2.new(dirpos.X, dirpos.Y)
                            line.Visible = true
                            tip.Position =  Vector2.new(dirpos.X, dirpos.Y)
                            offsetCFrame = CFrame.new(0, 0, -getgenv().settings.Length)
                            circle1.Visible = vis
                            circle2.Visible = vis
                            tip.Visible = vis
                        else
                            line.Visible = false
                            circle1.Visible = false
                            circle2.Visible = false
                            tip.Visible = false
                        end
                else 
                    line.Visible = false
                    circle1.Visible = false
                    circle2.Visible = false
                    tip.Visible = false
                end
            else 
                line.Visible = false
                circle1.Visible = false
                circle2.Visible = false
                tip.Visible = false
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= player.Name then
        ESP(v)
    end
end

game.Players.PlayerAdded:Connect(function(plr)
    if plr.Name ~= player.Name then
        ESP(plr)
    end
end)
