local Players = game.Players
local plr = Players.LocalPlayer
local loop = true
local retry = true
_G.name = "sword"
Mode = ""
Modes = {"enemy", "others"}
local reach = 10
local auto=true

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

  local function notify(Title, Text, Duration)
     Text = Text or "Text" 
     Title= Title or "Title"
     Duration = Duration or 5
    game:GetService("StarterGui"):SetCore("SendNotification",{
 Title = Title, 
 Text = Text,
 Duration = Duration,
})
    end

local function modeDetector(b)
if auto==true then
if not Teams: FindFirstChildOfClass "Team" then
Mode = "others"
	else
		Mode = "enemy"
	end
	else
		
	end
end

Window:Button("On", function()
		if Mode == "" then
notify ("please", "select mode")
		elseif auto == true then
    modeDetector()
    loop = true
    retry = true
    KillAura()
		end
end)

Window:Button("Off", function()
    loop = false
    retry = false
    
    loop = false
    retry = false    
end)

Window:Button("notify Tool name", function()
for I,v in pairs (plr.Character: GetChildren ()) do
if v:IsA"Tool" then
notify (v.Name, v.name)
wait(1)
end
end
if not plr.Character: FindFirstChildOfClass"Tool" then
notify ("Equip Tool", "Equip Tool")
end
end)

Window:Box("Reach - 10", function(text, focuslost)
   if focuslost then
   if not tonumber(text) then
    reach = tostring(10 or 10 and tonumber(string.format("%.2f", 10)))
    notify(reach, "nope string is wrong current reach is 10")
    elseif text == "" or tonumber(text) <= 10 then
    reach = 10
    notify("minimum", "the minimum reach is 10, current reach: "..reach)
    elseif text == "" or tonumber(text) >= 40 then
    reach = 40
    notify("maximum", "the maximum reach is 40, current reach: "..reach)
    end
   end
end)

Window:Box("Tool name", function(text, focuslost)
 if focuslost then
   if findTool(text) ~= nil then
    _G.name = tostring(text)
notify("Tool found:", tostring(text))
else
notify("Tool not found:", "no ".. text.. ". in ur backpack")
wait(1)
notify("it's ok", "if it just not equipped it well auto equip if u have")
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

notify ("YT: Random Vidzz", "https://www.youtube.com/@RandomVidzz-G",10)
