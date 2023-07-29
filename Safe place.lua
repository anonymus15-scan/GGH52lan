
  local terrain = Game.Workspace
 local Players = Game.Players 
 local plr = Players.LocalPlayer
 local oldPos = nil
 
 local Safe = Instance.new("Part", terrain)
 Safe.Name = plr.UserId
 Safe.Anchored = true
 Safe.Position = Vector3.new(0,99999,0)
 Safe.Size = Safe.Size+Vector3.new(300,4,200)
 Safe.Material = Enum.Material.Sand
 Safe.CanCollide = true
 wait()
 plr.Character.HumanoidRootPart.CFrame = Safe.CFrame+Vector3.new(0,3.4,0)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Safe_Place"
ScreenGui.Parent = Game.CoreGui

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true
Frame.Position = UDim2.fromScale(0, .9)
Frame.Size = UDim2.fromOffset(60, 30)

local Button = Instance.new("TextButton")
Button.Name = "Button"
Button.Parent = Frame
Button.Size = UDim2.fromOffset(60, 30)
Button.Text = "Safe"
Button.Visible = true
Button.MouseButton1Click:connect(function()
    if Button.Text == "Safe" then
  oldPos = plr.Character.HumanoidRootPart.CFrame
 plr.Character.HumanoidRootPart.CFrame = Safe.CFrame+Vector3.new(0,6.4,0)
plr.Character.HumanoidRootPart.Anchored = true
wait(1)
plr.Character.HumanoidRootPart.Anchored = false
  Button.Text = "Back"
 else
      plr.Character.HumanoidRootPart.CFrame = oldPos
      Button.Text = "Safe"
  end
   end)
