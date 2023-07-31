local Players = game.Players
local plr = Players.LocalPlayer
local loop = true
local retry = true
_G.name = "sword"
Mode = "enemy"
Modes = {"enemy", "others"}
local reach = 10
local auto=true
local N = Instance.new("BindableFunction")

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local Window = library:Window("Sword Fight Aura")

function findTool(String)
    local strl = String:lower()
    for i,v in pairs(plr.Backpack: GetChildren ()) do
       if v.Name:lower():match(strl) ~= nil then
          return v
          end
       end
    for i,v in pairs(plr.Character:GetChildren()) do
       if v.Name:lower():match(strl) ~= nil then
         return v
         end
       end
    end

function getTool()
    return findTool(_G.name)
   
end

function KillAura()
    loop = true
    if Mode == "enemy" then
    repeat
    for i,v in pairs(game.Players:GetPlayers()) do
	pcall(function()
	if v ~= game.Players.LocalPlayer and v.TeamColor.Name ~= plr.TeamColor.Name and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChildOfClass"ForceField" == nil then
    
	local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
	if Distance <= reach then
	for i = 1,25 do
    plr.Character.Humanoid.RootPart.CFrame = v.Character.Humanoid.RootPart.CFrame * CFrame.new(-1.6,0,1.8)
    local h = getTool()
    h.Parent = plr.Character
    h:Activate()
    if plr.Character:FindFirstChildOfClass"Tool".Name ~= getTool().Name then
        plr.Character:FindFirstChildOfClass"Humanoid": UnequipTools()
        end
    if v.Character.Humanoid.Health <= 0 then
    loop = false
    if retry == true then
    wait(1)
    KillAura()
    end
    end
	end
	end 
    end
	end)
	end
    game:GetService("RunService").Heartbeat:Wait()
    until loop == false

    elseif Mode == "others" then

    repeat
    for i,v in pairs(game.Players:GetPlayers()) do
	pcall(function()
	if v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChildOfClass"ForceField" == nil then
    
	local Distance = (v.Character:FindFirstChildOfClass("Part").Position - game.Players.LocalPlayer.Character:FindFirstChildOfClass("Part").Position).magnitude
	if Distance <= reach then
	for i = 1,25 do
    plr.Character.Humanoid.RootPart.CFrame = v.Character.Humanoid.RootPart.CFrame * CFrame.new(-1.6,0,1.8)
    local h = getTool()
    h.Parent = plr.Character
    h:Activate()
    if plr.Character:FindFirstChildOfClass"Tool".Name ~= getTool().Name then
        plr.Character:FindFirstChildOfClass"Humanoid": UnequipTools()
        end
    if v.Character.Humanoid.Health <= 0 then
    loop = false
    if retry == true then
    wait(1)
    KillAura()
    end
    end
	end
	end 
    end
	end)
	end
    game:GetService("RunService").Heartbeat:Wait()
    until loop == false
		
    end
    end
  
  local function notify1(Title, Text, con, Duration, Button, F)
  Title= Title or "GGH52Lan" Text = Text or "Text" Duration = Duration or 5 Button= Button or "Button"
  F = F or function() end
  con = con or "rbxassetid://14260295451"
 N.OnInvoke = F
  game:GetService("StarterGui"):SetCore("SendNotification",{
Title = Title;
Text = Text;
Icon = con;
Duration = Duration;
Button1 = Button;
Callback = N;})
  end

local function notify2(Title, Text, con, Duration, Button,B , F)
  Title= Title or "GGH52Lan" Text = Text or "Text" Duration = Duration or 5 Button= Button or "Button"
  F = F or function() end
  con = con or "rbxassetid://14260295451"
 N.OnInvoke = F
  game:GetService("StarterGui"):SetCore("SendNotification",{
Title = Title;
Text = Text;
Icon = con;
Duration = Duration;
Button1 = Button;
Button2 = B;
Callback = N;})
  end
  
  local function notify(Title, Text, con, Duration)
     Text = Text or "GGH52Lan" 
     Title= Title or "GGH52Lan"
     con = con or "rbxassetid://14260295451"
     Duration = Duration or 5
    game:GetService("StarterGui"):SetCore("SendNotification",{
 Title = Title;
 Text = Text;
 Duration = Duration;
 Icon = con;
})
    end

function GC(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		notify('Clipboard','Copied to clipboard')
	else
		notify('Clipboard',"Something went wrong 😕")
	end
end

local function modeDetector(b) 
if auto==true then
if not game:GetService"Teams": FindFirstChildOfClass "Team" then
Mode = "others"
	else
		Mode = "enemy"
	end
	else
		
	end
end

Window:Button("On", function()
    modeDetector()
    loop = true
    retry = true
    KillAura()

end)

Window:Button("Off", function()
    loop = false
    retry = false
    
    loop = false
    retry = false    
end)

Window:Button("notify Tool name", function()
for i,v in pairs (plr.Character: GetChildren ()) do
if v:IsA"Tool" then
notify2(v.Name, v.name, nil, 60, "TargetTool", "Ok", function (t)
if t == "TargetTool" then
_G.name = tostring(v.Name)
wait(1)
notify("Target Tool:", _G.name)
elseif t == "Ok" then
notify(nil, "👍")
end
end)
wait(1)
end
end
if not plr.Character: FindFirstChildOfClass"Tool" then
notify (nil, "Equip Tool")
end
end)

Window:Box("Reach - 10", function(text, focuslost)
   if focuslost then
   if not tonumber(text) then
    reach = tostring(10 or 10 and tonumber(string.format("%.2f", 10)))
    notify(nil, "only number is allowed, current reach: "..reach)
    elseif text == "" or tonumber(text) <= 10 then
    reach = 10
    notify(nil, "the minimum reach is 10, current reach: "..reach)
    elseif text == "" or tonumber(text) >= 40 then
    reach = 40
    notify(nil, "the maximum reach is 40, current reach: "..reach)
    end
   end
end)

Window:Box("Tool name", function(text, focuslost)
 if focuslost then
   if findTool(text) ~= nil then 
    _G.name = tostring(text)
notify("Tool found:", tostring(_G.name))
else
notify("Tool not found:", "no ".. text.. ". in ur backpack")
wait(1)
end
end
end)

local dropdown = Window:Dropdown("Mode", {"auto", "enemies only", "others"}, function(o)
    if o == "enemies only" then
    Mode = "enemy"
			auto=false
    elseif o == "others" then
     Mode = "others"
			auto=false
		elseif o == "auto" then
			auto = true
    end
end)

notify2 ("YT: Random Vidzz", "https://www.youtube.com/@RandomVidzz-G",nil, 60,"Copy", "👍", function (G)
if G=="Copy" then
GC("https://www.youtube.com/@RandomVidzz-G")
notify ("copied", "copied", "rbxassetid://14260295451")
elseif G=="👍" then
notify(":(", ":(", "rbxassetid://14260616969")
end
end)
return _G.name

